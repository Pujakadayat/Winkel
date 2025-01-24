
// import 'package:flutter/material.dart';

// class ChatScreen extends StatefulWidget {
//   final String deliveryPersonName;

//   ChatScreen({required this.deliveryPersonName});

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _messageController = TextEditingController();
//   final List<Map<String, String>> _messages = [];

//   void _sendMessage() {
//     if (_messageController.text.trim().isNotEmpty) {
//       setState(() {
//         _messages.add({
//           'sender': 'customer',
//           'message': _messageController.text.trim(),
//         });
//       });
//       _messageController.clear();

//       // Simulate a response from the delivery person
//       Future.delayed(Duration(seconds: 1), () {
//         setState(() {
//           _messages.add({
//             'sender': 'delivery',
//             'message': 'Got it! I will update you soon.',
//           });
//         });
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat with ${widget.deliveryPersonName}'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               padding: EdgeInsets.all(10.0),
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 bool isCustomer = _messages[index]['sender'] == 'customer';
//                 return Align(
//                   alignment:
//                       isCustomer ? Alignment.centerRight : Alignment.centerLeft,
//                   child: Container(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
//                     margin: EdgeInsets.symmetric(vertical: 5.0),
//                     decoration: BoxDecoration(
//                       color: isCustomer ? Colors.blue : Colors.grey[300],
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: Text(
//                       _messages[index]['message']!,
//                       style: TextStyle(
//                         color: isCustomer ? Colors.white : Colors.black,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//             color: Colors.white,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: InputDecoration(
//                       hintText: 'Type your message...',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10.0),
//                 ElevatedButton(
//                   onPressed: _sendMessage,
//                   child: Icon(Icons.send),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   final String deliveryBoyName = 'Wes Ton';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) =>
//                     ChatScreen(deliveryPersonName: deliveryBoyName),
//               ),
//             );
//           },
//           child: Container(
//             color: Colors.black.withOpacity(0.5),
//             child: ListTile(
//               leading: Icon(Icons.chat, color: Colors.white),
//               title: Text(
//                 'Chat with $deliveryBoyName',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: HomeScreen(),
//   ));
// }

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreen extends StatefulWidget {
  final String vendorId;
  final String vendorName;

  const ChatScreen({Key? key, required this.vendorId, required this.vendorName})
      : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String? currentUserId; // Store the current user's UID
  String? buyerId; // Store the buyer's name
  String? vendorName;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        setState(() {
          currentUserId = user.uid; // Store the current user's UID
        });

        // Fetch buyer data
        final buyerDoc = await FirebaseFirestore.instance
            .collection('buyers')
            .doc(user.uid)
            .get();

        // Fetch vendor data
        final vendorDoc = await FirebaseFirestore.instance
            .collection('vendors')
            .doc(widget.vendorId)
            .get();

        if (buyerDoc.exists && vendorDoc.exists) {
          setState(() {
            buyerId = buyerDoc.get('fullName');
            vendorName = vendorDoc.get('bussinessName');
          });
        }
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  Future<void> _sendMessage(String text, {String? imageUrl}) async {
    if ((text.trim().isEmpty && imageUrl == null) || currentUserId == null)
      return;

    final timestamp = Timestamp.now();
    final message = {
      'text': text,
      'imageUrl': imageUrl,
      'senderId': currentUserId, // Use the current user's UID
      'senderName': buyerId,
      'vendorId': widget.vendorId,
      'timestamp': timestamp,
      'isCustomer':
          true, // Add this field to distinguish between customer and vendor
    };

    try {
      // Create a unique chat room ID combining vendor and customer IDs
      String chatRoomId = '${widget.vendorId}_${currentUserId}';

      await FirebaseFirestore.instance
          .collection('chatRooms')
          .doc(chatRoomId)
          .collection('messages')
          .add(message);

      _messageController.clear();

      // Send automated vendor message after customer sends a message
      await _sendAutomatedMessage();
    } catch (e) {
      print("Error sending message: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send message. Please try again.')),
      );
    }
  }

  Future<void> _sendAutomatedMessage() async {
    try {
      final timestamp = Timestamp.now();
      final automatedMessage = {
        'text':
            'Thank you for your message! Our team will get back to you shortly.',
        'senderId': widget.vendorId,
        'senderName': vendorName,
        'vendorId': widget.vendorId,
        'timestamp': timestamp,
        'isCustomer': false, // Mark it as vendor's message
      };

      String chatRoomId = '${widget.vendorId}_${currentUserId}';

      await FirebaseFirestore.instance
          .collection('chatRooms')
          .doc(chatRoomId)
          .collection('messages')
          .add(automatedMessage);
    } catch (e) {
      print("Error sending automated message: $e");
    }
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        final ref = FirebaseStorage.instance
            .ref()
            .child('chat_images')
            .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

        final uploadTask = ref.putFile(File(pickedFile.path));

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) =>
              const Center(child: CircularProgressIndicator()),
        );

        final snapshot = await uploadTask;
        final imageUrl = await snapshot.ref.getDownloadURL();

        Navigator.of(context).pop(); // Close progress dialog
        await _sendMessage('', imageUrl: imageUrl);
      }
    } catch (e) {
      print("Error picking/uploading image: $e");
      Navigator.of(context).pop(); // Close progress dialog if open
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload image. Please try again.')),
      );
    }
  }

  Widget _buildMessage(DocumentSnapshot messageDoc) {
    final data = messageDoc.data() as Map<String, dynamic>;
    final isCustomerMessage = data['isCustomer'] == true;
    final alignment =
        isCustomerMessage ? Alignment.centerRight : Alignment.centerLeft;
    final color = isCustomerMessage ? Colors.deepPurple : Colors.grey[300];
    final textColor = isCustomerMessage ? Colors.white : Colors.black;

    return Align(
      alignment: alignment,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft:
                isCustomerMessage ? const Radius.circular(12) : Radius.zero,
            bottomRight:
                isCustomerMessage ? Radius.zero : const Radius.circular(12),
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['senderName'] ?? 'Unknown',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            if (data['imageUrl'] != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  data['imageUrl'],
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 200,
                      height: 200,
                      color: Colors.grey[300],
                      child: Icon(Icons.error),
                    );
                  },
                ),
              ),
            if (data['text']?.isNotEmpty ?? false)
              Padding(
                padding:
                    EdgeInsets.only(top: data['imageUrl'] != null ? 8.0 : 0),
                child: Text(
                  data['text'],
                  style: TextStyle(color: textColor),
                ),
              ),
            Text(
              _formatTimestamp(data['timestamp'] as Timestamp),
              style: TextStyle(
                color: textColor.withOpacity(0.7),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTimestamp(Timestamp timestamp) {
    final now = DateTime.now();
    final date = timestamp.toDate();
    if (now.difference(date).inDays == 0) {
      return '${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    }
    return '${date.day}/${date.month} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserId == null) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.vendorName)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    // Create a unique chat room ID
    String chatRoomId = '${widget.vendorId}_${currentUserId}';

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(vendorName ?? widget.vendorName),
            if (buyerId != null)
              Text(
                buyerId!,
                style: TextStyle(fontSize: 12),
              ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('chatRooms')
                  .doc(chatRoomId)
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text("No messages yet. Start the conversation!"),
                  );
                }

                return ListView.builder(
                  reverse: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return _buildMessage(snapshot.data!.docs[index]);
                  },
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, -2),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.image),
                  onPressed: _pickImage,
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    maxLines: null,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _sendMessage(_messageController.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}