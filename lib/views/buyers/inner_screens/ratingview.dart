
import 'package:flutter/material.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart';

// class RatingViewPage extends StatefulWidget {
//   final Function(String, int) onSubmit;

//   const RatingViewPage({required this.onSubmit, Key? key}) : super(key: key);

//   @override
//   _RatingViewPageState createState() => _RatingViewPageState();
// }

// class _RatingViewPageState extends State<RatingViewPage> {
//   final _controller = TextEditingController();
//   int _rating = 5;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           controller: _controller,
//           decoration: InputDecoration(hintText: 'Write your review...'),
//         ),
//         Slider(
//           value: _rating.toDouble(),
//           min: 1,
//           max: 5,
//           divisions: 4,
//           label: '$_rating',
//           onChanged: (value) {
//             setState(() {
//               _rating = value.toInt();
//             });
//           },
//         ),
//         ElevatedButton(
//           onPressed: () {
//             widget.onSubmit(_controller.text, _rating);
//             _controller.clear();
//           },
//           child: Text('Submit Review'),
//         ),
//       ],
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RatingViewPage extends StatelessWidget {
  final Stream<QuerySnapshot> _deliveredOrdersStream = FirebaseFirestore.instance
      .collection('orders')
      .where('buyerId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .where('delivered', isEqualTo: true) // Only delivered orders
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade900,
        title: const Text('Rate Orders'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _deliveredOrdersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.yellow.shade900),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No Delivered Orders to Rate'),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              final orderData = document.data() as Map<String, dynamic>;

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(orderData['productImage'][0]),
                ),
                title: Text(orderData['productName'] ?? 'N/A'),
                subtitle: Text('Quantity: ${orderData['quantity'] ?? 'N/A'}'),
                trailing: ElevatedButton(
                  onPressed: () {
                    _showRatingDialog(context, orderData['orderId']);
                  },
                  child: const Text('Rate'),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  void _showRatingDialog(BuildContext context, String orderId) {
    double _rating = 3.0;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Rate the Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Please rate your experience:'),
              Slider(
                value: _rating,
                onChanged: (value) {
                  _rating = value;
                },
                min: 1.0,
                max: 5.0,
                divisions: 4,
                label: _rating.toString(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('orders').doc(orderId).update({
                  'rating': _rating,
                });
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
