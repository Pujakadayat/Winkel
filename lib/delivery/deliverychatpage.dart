import 'dart:async';

import 'package:flutter/material.dart';
import 'package:winkle_final/delivery/orderdtrack.dart';
import 'package:winkle_final/views/buyers/inner_screens/deliverychatapp.dart';
import 'package:winkle_final/views/buyers/inner_screens/ordertracking.dart';
// import 'package:winkle_final/views/buyers/inner_screens/ordertracking.dart';

// class DeliveryChatPage extends StatefulWidget {
//   final String deliveryBoyName;

//   const DeliveryChatPage({Key? key, required this.deliveryBoyName})
//       : super(key: key);

//   @override
//   State<DeliveryChatPage> createState() => _DeliveryChatPageState();
// }

// class _DeliveryChatPageState extends State<DeliveryChatPage> {
//   bool isHovering = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat with ${widget.deliveryBoyName}'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Stack(
//         children: [
//           // Background image
//           Positioned.fill(
//             child: Image.asset(
//               'assets/images/deliveryboy.png',
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) {
//                 print("Error loading image: $error");
//                 return Center(
//                   child: Text(
//                     'Image not available',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           // Content over the image
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // Chat box
//               // Padding(
//               //   padding: const EdgeInsets.all(16.0),
//               //   child: Container(
//               //     color: Colors.black.withOpacity(0.5),
//               //     child: ListTile(
//               //       leading: Icon(Icons.chat, color: Colors.white),
//               //       title: Text(
//               //         'Chat with ${widget.deliveryBoyName}',
//               //         style: TextStyle(color: Colors.white),
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ChatScreen(
//                           deliveryPersonName: widget.deliveryBoyName),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   color: Colors.black.withOpacity(0.5),
//                   child: ListTile(
//                     leading: Icon(Icons.chat, color: Colors.white),
//                     title: Text(
//                       'Chat with ${widget.deliveryBoyName}',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//               // Track Order Button with hover effect
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: MouseRegion(
//                   onEnter: (_) => setState(() {
//                     isHovering = true;
//                   }),
//                   onExit: (_) => setState(() {
//                     isHovering = false;
//                   }),
//                   child: AnimatedContainer(
//                     duration: Duration(milliseconds: 200),
//                     decoration: BoxDecoration(
//                       color: isHovering ? Colors.blue[700] : Colors.blue,
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Navigate to the Order Tracking Map Screen
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 OrderTrackingMap(), // Use existing OrderTrackingMap
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.transparent,
//                         shadowColor: Colors.transparent,
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 12.0,
//                           horizontal: 24.0,
//                         ),
//                         child: Text(
//                           'Track Your Order',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


class DeliveryChatPage extends StatefulWidget {
  final String deliveryBoyName;

  const DeliveryChatPage({
    Key? key,
    required this.deliveryBoyName,
  }) : super(key: key);

  @override
  State<DeliveryChatPage> createState() => _DeliveryChatPageState();
}

class _DeliveryChatPageState extends State<DeliveryChatPage> {
  bool isHovering = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Set a timer to start order tracking automatically after 10 seconds
    _timer = Timer(const Duration(seconds: 10), () {
      // Navigate to the order tracking map
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderTrackZenWidget(),
        ),
      ).then((_) {
        // After tracking is completed, navigate to the homepage
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/homepage', // Replace with the route name of your homepage
          (route) => false,
        );
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer if the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.deliveryBoyName}'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/deliveryboy.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                print("Error loading image: $error");
                return Center(
                  child: Text(
                    'Image not available',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
          // Content over the image
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Chat box
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: ListTile(
                    leading: Icon(Icons.chat, color: Colors.white),
                    title: Text(
                      'Chat with ${widget.deliveryBoyName}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              // Track Order Button with hover effect
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: MouseRegion(
                  onEnter: (_) => setState(() {
                    isHovering = true;
                  }),
                  onExit: (_) => setState(() {
                    isHovering = false;
                  }),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: isHovering ? Colors.blue[700] : Colors.blue,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the Order Tracking Map Screen immediately
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderTrackingMap(),
                          ),
                        ).then((_) {
                          // Navigate to the homepage after tracking
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/homescreen', // Replace with your homepage route name
                            (route) => false,
                          );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 24.0,
                        ),
                        child: Text(
                          'Track Your Order',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
