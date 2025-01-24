// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_slidable/flutter_slidable.dart';

// // import 'package:intl/intl.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_slidable/flutter_slidable.dart';

// // import 'package:intl/intl.dart';

// // // class VendorOrderScreen extends StatelessWidget {
// // //   String formatedDate(date) {
// // //     final outPutDateFormate = DateFormat('dd/MM/yyyy');

// // //     final outPutDate = outPutDateFormate.format(date);

// // //     return outPutDate;
// // //   }

// // //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final Stream<QuerySnapshot> _ordersStream = FirebaseFirestore.instance
// // //         .collection('orders')
// // //         .where('vendorId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
// // //         .snapshots();

// // //     return Scaffold(
// // //         appBar: AppBar(
// // //           backgroundColor: Colors.yellow.shade900,
// // //           elevation: 0,
// // //           title: Text(
// // //             'My Orders',
// // //             style: TextStyle(
// // //               color: Colors.white,
// // //               fontSize: 18,
// // //               fontWeight: FontWeight.bold,
// // //               letterSpacing: 5,
// // //             ),
// // //           ),
// // //         ),
// // //         body: StreamBuilder<QuerySnapshot>(
// // //           stream: _ordersStream,
// // //           builder:
// // //               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// // //             if (snapshot.hasError) {
// // //               return Text('Something went wrong');
// // //             }

// // //             if (snapshot.connectionState == ConnectionState.waiting) {
// // //               return Center(
// // //                 child: CircularProgressIndicator(color: Colors.yellow.shade900),
// // //               );
// // //             }

// // //             return ListView(
// // //               children: snapshot.data!.docs.map((DocumentSnapshot document) {
// // //                 return Slidable(
// // //                     child: Column(
// // //                       children: [
// // //                         ListTile(
// // //                           leading: CircleAvatar(
// // //                               backgroundColor: Colors.white,
// // //                               radius: 14,
// // //                               child: document['accepted'] == true
// // //                                   ? Icon(Icons.delivery_dining)
// // //                                   : Icon(Icons.access_time)),
// // //                           title: document['accepted'] == true
// // //                               ? Text(
// // //                                   'Accepted',
// // //                                   style:
// // //                                       TextStyle(color: Colors.yellow.shade900),
// // //                                 )
// // //                               : Text(
// // //                                   'Not Accepted',
// // //                                   style: TextStyle(
// // //                                     color: Colors.red,
// // //                                   ),
// // //                                 ),
// // //                           trailing: Text(
// // //                             'Amount' +
// // //                                 ' ' +
// // //                                 document['productPrice'].toStringAsFixed(2),
// // //                             style: TextStyle(fontSize: 17, color: Colors.blue),
// // //                           ),
// // //                           subtitle: Text(
// // //                             formatedDate(
// // //                               document['orderDate'].toDate(),
// // //                             ),
// // //                             style: TextStyle(
// // //                               fontSize: 14,
// // //                               fontWeight: FontWeight.bold,
// // //                               color: Colors.blue,
// // //                             ),
// // //                           ),
// // //                         ),
// // //                         ExpansionTile(
// // //                           title: Text(
// // //                             'Order Details',
// // //                             style: TextStyle(
// // //                               color: Colors.yellow.shade900,
// // //                               fontSize: 15,
// // //                             ),
// // //                           ),
// // //                           subtitle: Text('View Order Details'),
// // //                           children: [
// // //                             ListTile(
// // //                               leading: CircleAvatar(
// // //                                 child: Image.network(
// // //                                   document['productImage'][0],
// // //                                 ),
// // //                               ),
// // //                               title: Text(document['productName']),
// // //                               subtitle: Column(
// // //                                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                                 children: [
// // //                                   Row(
// // //                                     mainAxisAlignment:
// // //                                         MainAxisAlignment.spaceAround,
// // //                                     children: [
// // //                                       Text(
// // //                                         ('Quantity'),
// // //                                         style: TextStyle(
// // //                                             fontSize: 14,
// // //                                             fontWeight: FontWeight.bold),
// // //                                       ),
// // //                                       Text(
// // //                                         document['quantity'].toString(),
// // //                                       ),
// // //                                     ],
// // //                                   ),
// // //                                   document['accepted'] == true
// // //                                       ? Row(
// // //                                           mainAxisAlignment:
// // //                                               MainAxisAlignment.spaceEvenly,
// // //                                           children: [
// // //                                             Text('Schedule Delivery Date'),
// // //                                             Text(formatedDate(
// // //                                                 document['scheduleDate']
// // //                                                     .toDate()))
// // //                                           ],
// // //                                         )
// // //                                       : Text(''),
// // //                                   ListTile(
// // //                                     title: Text(
// // //                                       'Buyer Details',
// // //                                       style: TextStyle(
// // //                                         fontSize: 18,
// // //                                       ),
// // //                                     ),
// // //                                     subtitle: Column(
// // //                                       mainAxisAlignment:
// // //                                           MainAxisAlignment.start,
// // //                                       crossAxisAlignment:
// // //                                           CrossAxisAlignment.start,
// // //                                       children: [
// // //                                         Text(document['fullName']),
// // //                                         Text(document['email']),
// // //                                         Text(document['address']),
// // //                                       ],
// // //                                     ),
// // //                                   )
// // //                                 ],
// // //                               ),
// // //                             )
// // //                           ],
// // //                         )
// // //                       ],
// // //                     ),
// // //                     startActionPane: ActionPane(
// // //                       motion: const ScrollMotion(),
// // //                       children: [
// // //                         SlidableAction(
// // //                           onPressed: (context) async {
// // //                             await _firestore
// // //                                 .collection('orders')
// // //                                 .doc(document['orderId'])
// // //                                 .update({
// // //                               'accepted': false,
// // //                             });
// // //                           },
// // //                           backgroundColor: Color(0xFFFE4A49),
// // //                           foregroundColor: Colors.white,
// // //                           icon: Icons.delete,
// // //                           label: 'Reject',
// // //                         ),
// // //                         SlidableAction(
// // //                           onPressed: (context) async {
// // //                             await _firestore
// // //                                 .collection('orders')
// // //                                 .doc(document['orderId'])
// // //                                 .update({
// // //                               'accepted': true,
// // //                             });
// // //                           },
// // //                           backgroundColor: Color(0xFF21B7CA),
// // //                           foregroundColor: Colors.white,
// // //                           icon: Icons.share,
// // //                           label: 'Accept',
// // //                         ),
// // //                       ],
// // //                     ));
// // //               }).toList(),
// // //             );
// // //           },
// // //         ));
// // //   }
// // // }


// // // class VendorOrderScreen extends StatelessWidget {
// // //   String formatedDate(date) {
// // //     final outPutDateFormate = DateFormat('dd/MM/yyyy');
// // //     return outPutDateFormate.format(date);
// // //   }

// // //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// // //   // Method to fetch customer details
// // //   Future<Map<String, dynamic>> fetchCustomerDetails(String buyerId) async {
// // //     final customerSnapshot = await _firestore.collection('users').doc(buyerId).get();
// // //     return customerSnapshot.exists ? customerSnapshot.data() as Map<String, dynamic> : {};
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final Stream<QuerySnapshot> _ordersStream = FirebaseFirestore.instance
// // //         .collection('orders')
// // //         .where('vendorId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
// // //         .snapshots();

// // //     return Scaffold(
// // //         appBar: AppBar(
// // //           backgroundColor: Colors.yellow.shade900,
// // //           elevation: 0,
// // //           title: Text(
// // //             'My Orders',
// // //             style: TextStyle(
// // //               color: Colors.white,
// // //               fontSize: 18,
// // //               fontWeight: FontWeight.bold,
// // //               letterSpacing: 5,
// // //             ),
// // //           ),
// // //         ),
// // //         body: StreamBuilder<QuerySnapshot>(
// // //           stream: _ordersStream,
// // //           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// // //             if (snapshot.hasError) {
// // //               return Text('Something went wrong');
// // //             }

// // //             if (snapshot.connectionState == ConnectionState.waiting) {
// // //               return Center(
// // //                 child: CircularProgressIndicator(color: Colors.yellow.shade900),
// // //               );
// // //             }

// // //             return ListView(
// // //               children: snapshot.data!.docs.map((DocumentSnapshot document) {
// // //                 return Column(
// // //                   children: [
// // //                     ListTile(
// // //                       leading: CircleAvatar(
// // //                         backgroundColor: Colors.white,
// // //                         radius: 14,
// // //                         child: document['accepted'] == true
// // //                             ? Icon(Icons.delivery_dining)
// // //                             : Icon(Icons.access_time),
// // //                       ),
// // //                       title: document['accepted'] == true
// // //                           ? Text(
// // //                               'Accepted',
// // //                               style: TextStyle(color: Colors.yellow.shade900),
// // //                             )
// // //                           : Text(
// // //                               'Not Accepted',
// // //                               style: TextStyle(color: Colors.red),
// // //                             ),
// // //                       subtitle: Column(
// // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // //                         children: [
// // //                           Text('Product: ${document['productName']}'),
// // //                           Text('Quantity: ${document['quantity']}'),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                     // Approve/Reject buttons
// // //                     Row(
// // //                       mainAxisAlignment: MainAxisAlignment.center,
// // //                       children: [
// // //                         ElevatedButton(
// // //                           onPressed: () async {
// // //                             await _firestore.collection('orders').doc(document['orderId']).update({
// // //                               'accepted': true,
// // //                             });
// // //                           },
// // //                           style: ElevatedButton.styleFrom(
// // //                             backgroundColor: Colors.blueGrey,
                            
// // //                           ),
// // //                           child: Text('Approve',
// // //                           style: TextStyle(color: Colors.black),),
// // //                         ),
// // //                         SizedBox(width: 10),
// // //                         ElevatedButton(
// // //                           onPressed: () async {
// // //                             await _firestore.collection('orders').doc(document['orderId']).update({
// // //                               'accepted': false,
// // //                             });
// // //                           },
// // //                           style: ElevatedButton.styleFrom(
// // //                             backgroundColor: Colors.redAccent,
// // //                           ),
// // //                           child: Text('Reject',
// // //                           style: TextStyle(color: Colors.black),),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ],
// // //                 );
// // //               }).toList(),
// // //             );
// // //           },
// // //         ));
// // //   }
// // // }


// // // class VendorOrderScreen extends StatelessWidget {
// // //   String formatedDate(date) {
// // //     final outPutDateFormate = DateFormat('dd/MM/yyyy');
// // //     return outPutDateFormate.format(date);
// // //   }

// // //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// // //   // Method to fetch customer details
// // //   Future<String> fetchCustomerName(String buyerId) async {
// // //     final customerSnapshot = await _firestore.collection('orders').doc(buyerId).get();
// // //     if (customerSnapshot.exists) {
// // //       final customerData = customerSnapshot.data() as Map<String, dynamic>;
// // //       return customerData['fullName'] ?? 'Unknown Customer'; // Replace 'name' with your actual field for the customer's name
// // //     }
// // //     return 'Unknown Customer';
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final Stream<QuerySnapshot> _ordersStream = FirebaseFirestore.instance
// // //         .collection('orders')
// // //         .where('vendorId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
// // //         .snapshots();

// // //     return Scaffold(
// // //         appBar: AppBar(
// // //           backgroundColor: Colors.yellow.shade900,
// // //           elevation: 0,
// // //           title: Text(
// // //             'My Orders',
// // //             style: TextStyle(
// // //               color: Colors.white,
// // //               fontSize: 18,
// // //               fontWeight: FontWeight.bold,
// // //               letterSpacing: 5,
// // //             ),
// // //           ),
// // //         ),
// // //         body: StreamBuilder<QuerySnapshot>(
// // //           stream: _ordersStream,
// // //           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// // //             if (snapshot.hasError) {
// // //               return Text('Something went wrong');
// // //             }

// // //             if (snapshot.connectionState == ConnectionState.waiting) {
// // //               return Center(
// // //                 child: CircularProgressIndicator(color: Colors.yellow.shade900),
// // //               );
// // //             }

// // //             return ListView(
// // //               children: snapshot.data!.docs.map((DocumentSnapshot document) {
// // //                 return FutureBuilder<String>(
// // //                   future: fetchCustomerName(document['buyerId']),
// // //                   builder: (context, customerSnapshot) {
// // //                     if (customerSnapshot.connectionState == ConnectionState.waiting) {
// // //                       return Center(child: CircularProgressIndicator());
// // //                     }
// // //                     if (customerSnapshot.hasError) {
// // //                       return Text('Error loading customer name');
// // //                     }
// // //                     final customerName = customerSnapshot.data;

// // //                     return Column(
// // //                       children: [
// // //                         ListTile(
// // //                           leading: CircleAvatar(
// // //                             backgroundColor: Colors.white,
// // //                             radius: 14,
// // //                             child: document['accepted'] == true
// // //                                 ? Icon(Icons.delivery_dining)
// // //                                 : Icon(Icons.access_time),
// // //                           ),
// // //                           title: document['accepted'] == true
// // //                               ? Text(
// // //                                   'Accepted',
// // //                                   style: TextStyle(color: Colors.yellow.shade900),
// // //                                 )
// // //                               : Text(
// // //                                   'Not Accepted',
// // //                                   style: TextStyle(color: Colors.red),
// // //                                 ),
// // //                           subtitle: Column(
// // //                             crossAxisAlignment: CrossAxisAlignment.start,
// // //                             children: [
// // //                               Text('Customer: $customerName'),
// // //                               Text('Product: ${document['productName']}'),
// // //                               Text('Quantity: ${document['quantity']}'),
// // //                             ],
// // //                           ),
// // //                         ),
// // //                         // Approve/Reject buttons
// // //                         Row(
// // //                           mainAxisAlignment: MainAxisAlignment.center,
// // //                           children: [
// // //                             ElevatedButton(
// // //                               onPressed: () async {
// // //                                 await _firestore.collection('orders').doc(document['orderId']).update({
// // //                                   'accepted': true,
// // //                                 });
// // //                               },
// // //                               style: ElevatedButton.styleFrom(
// // //                                 backgroundColor: Colors.blueGrey,
// // //                               ),
// // //                               child: Text(
// // //                                 'Approve',
// // //                                 style: TextStyle(color: Colors.black),
// // //                               ),
// // //                             ),
// // //                             SizedBox(width: 10),
// // //                             ElevatedButton(
// // //                               onPressed: () async {
// // //                                 await _firestore.collection('orders').doc(document['orderId']).update({
// // //                                   'accepted': false,
// // //                                 });
// // //                               },
// // //                               style: ElevatedButton.styleFrom(
// // //                                 backgroundColor: Colors.redAccent,
// // //                               ),
// // //                               child: Text(
// // //                                 'Reject',
// // //                                 style: TextStyle(color: Colors.black),
// // //                               ),
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ],
// // //                     );
// // //                   },
// // //                 );
// // //               }).toList(),
// // //             );
// // //           },
// // //         ));
// // //   }
// // // }




// // class VendorOrderScreen extends StatelessWidget {
// //   String formatedDate(date) {
// //     final outPutDateFormate = DateFormat('dd/MM/yyyy');
// //     return outPutDateFormate.format(date);
// //   }

// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// //   @override
// //   Widget build(BuildContext context) {
// //     final Stream<QuerySnapshot> _ordersStream = FirebaseFirestore.instance
// //         .collection('orders')
// //         .where('vendorId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
// //         .snapshots();

// //     return Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: Colors.yellow.shade900,
// //           elevation: 0,
// //           title: Text(
// //             'My Orders',
// //             style: TextStyle(
// //               color: Colors.white,
// //               fontSize: 18,
// //               fontWeight: FontWeight.bold,
// //               letterSpacing: 5,
// //             ),
// //           ),
// //         ),
// //         body: StreamBuilder<QuerySnapshot>(
// //           stream: _ordersStream,
// //           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// //             if (snapshot.hasError) {
// //               return Text('Something went wrong');
// //             }

// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               return Center(
// //                 child: CircularProgressIndicator(color: Colors.yellow.shade900),
// //               );
// //             }

// //             return ListView(
// //               children: snapshot.data!.docs.map((DocumentSnapshot document) {
// //                 final orderData = document.data() as Map<String, dynamic>;

// //                 return Column(
// //                   children: [
// //                     ListTile(
// //                       leading: CircleAvatar(
// //                         backgroundColor: Colors.white,
// //                         radius: 14,
// //                         child: orderData['accepted'] == true
// //                             ? Icon(Icons.delivery_dining)
// //                             : Icon(Icons.access_time),
// //                       ),
// //                       title: orderData['accepted'] == true
// //                           ? Text(
// //                               'Accepted',
// //                               style: TextStyle(color: Colors.yellow.shade900),
// //                             )
// //                           : Text(
// //                               'Not Accepted',
// //                               style: TextStyle(color: Colors.red),
// //                             ),
// //                       subtitle: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text('Customer: ${orderData['fullName'] ?? 'Unknown Customer'}'),
// //                           Text('Product: ${orderData['productName']}'),
// //                           Text('Quantity: ${orderData['quantity']}'),
// //                         ],
// //                       ),
// //                     ),
// //                     // Approve/Reject buttons
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         ElevatedButton(
// //                           onPressed: () async {
// //                             await _firestore.collection('orders').doc(orderData['orderId']).update({
// //                               'accepted': true,
// //                             });
// //                           },
// //                           style: ElevatedButton.styleFrom(
// //                             backgroundColor: Colors.blueGrey,
// //                           ),
// //                           child: Text(
// //                             'Approve',
// //                             style: TextStyle(color: Colors.black),
// //                           ),
// //                         ),
// //                         SizedBox(width: 10),
// //                         ElevatedButton(
// //                           onPressed: () async {
// //                             await _firestore.collection('orders').doc(orderData['orderId']).update({
// //                               'accepted': false,
// //                             });
// //                           },
// //                           style: ElevatedButton.styleFrom(
// //                             backgroundColor: Colors.redAccent,
// //                           ),
// //                           child: Text(
// //                             'Reject',
// //                             style: TextStyle(color: Colors.black),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 );
// //               }).toList(),
// //             );
// //           },
// //         ));
// //   }
// // }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class VendorOrderScreen extends StatelessWidget {
//   String formatedDate(date) {
//     final outPutDateFormate = DateFormat('dd/MM/yyyy');
//     return outPutDateFormate.format(date);
//   }

//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.yellow.shade900,
//           elevation: 0,
//           title: Text(
//             'My Orders',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               letterSpacing: 5,
//             ),
//           ),
//           bottom: TabBar(
//             tabs: [
//               Tab(text: 'Accepted'),
//               Tab(text: 'Pending'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             // Accepted Orders Tab
//             OrdersList(acceptedStatus: true),
//             // Pending Orders Tab
//             OrdersList(acceptedStatus: false),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class OrdersList extends StatelessWidget {
//   final bool acceptedStatus;

//   OrdersList({required this.acceptedStatus});

//   @override
//   Widget build(BuildContext context) {
//     final Stream<QuerySnapshot> _ordersStream = FirebaseFirestore.instance
//         .collection('orders')
//         .where('vendorId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//         .where('accepted', isEqualTo: acceptedStatus)
//         .snapshots();

//     return StreamBuilder<QuerySnapshot>(
//       stream: _ordersStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Center(child: Text('Something went wrong'));
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(color: Colors.yellow.shade900),
//           );
//         }

//         if (snapshot.data!.docs.isEmpty) {
//           return Center(
//             child: Text(
//               'No ${acceptedStatus ? 'Accepted' : 'Pending'} Orders',
//               style: TextStyle(color: Colors.grey, fontSize: 16),
//             ),
//           );
//         }

//         return ListView(
//           children: snapshot.data!.docs.map((DocumentSnapshot document) {
//             final orderData = document.data() as Map<String, dynamic>;

//             return Column(
//               children: [
//                 ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     radius: 14,
//                     child: acceptedStatus
//                         ? Icon(Icons.delivery_dining, color: Colors.green)
//                         : Icon(Icons.access_time, color: Colors.red),
//                   ),
//                   title: Text(
//                     acceptedStatus ? 'Accepted' : 'Pending',
//                     style: TextStyle(
//                       color: acceptedStatus ? Colors.green : Colors.red,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Customer: ${orderData['fullName'] ?? 'Unknown Customer'}'),
//                       Text('Product: ${orderData['productName']}'),
//                       Text('Quantity: ${orderData['quantity']}'),
//                     ],
//                   ),
//                 ),
//                 // Approve/Reject buttons for Pending Orders only
//                 if (!acceptedStatus)
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () async {
//                           await FirebaseFirestore.instance
//                               .collection('orders')
//                               .doc(orderData['orderId'])
//                               .update({'accepted': true});
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blueGrey,
//                         ),
//                         child: Text(
//                           'Approve',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       ElevatedButton(
//                         onPressed: () async {
//                           await FirebaseFirestore.instance
//                               .collection('orders')
//                               .doc(orderData['orderId'])
//                               .update({'accepted': false});
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.redAccent,
//                         ),
//                         child: Text(
//                           'Reject',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ),
//                     ],
//                   ),
//               ],
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// class VendorOrderScreen extends StatelessWidget {
//   String formatedDate(date) {
//     final outPutDateFormate = DateFormat('dd/MM/yyyy');
//     return outPutDateFormate.format(date);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.yellow.shade900,
//           elevation: 0,
//           title: Text(
//             'My Orders',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               letterSpacing: 5,
//             ),
//           ),
//           bottom: TabBar(
//             tabs: [
//               Tab(text: 'Accepted'),
//               Tab(text: 'Pending'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             // Accepted Orders Tab
//             OrdersList(acceptedStatus: true),
//             // Pending Orders Tab
//             OrdersList(acceptedStatus: false),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class OrdersList extends StatelessWidget {
//   final bool acceptedStatus;

//   OrdersList({required this.acceptedStatus});

//   @override
//   Widget build(BuildContext context) {
//     final Stream<QuerySnapshot> _ordersStream = FirebaseFirestore.instance
//         .collection('orders')
//         .where('vendorId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//         .where('accepted', isEqualTo: acceptedStatus)
//         .snapshots();

//     return StreamBuilder<QuerySnapshot>(
//       stream: _ordersStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Center(child: Text('Something went wrong'));
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(color: Colors.yellow.shade900),
//           );
//         }

//         if (snapshot.data!.docs.isEmpty) {
//           return Center(
//             child: Text(
//               'No ${acceptedStatus ? 'Accepted' : 'Pending'} Orders',
//               style: TextStyle(color: Colors.grey, fontSize: 16),
//             ),
//           );
//         }

//         return ListView(
//           children: snapshot.data!.docs.map((DocumentSnapshot document) {
//             final orderData = document.data() as Map<String, dynamic>;
//             final isDelivered = orderData['delivered'] == true;

//             return Column(
//               children: [
//                 ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     radius: 14,
//                     child: Icon(
//                       acceptedStatus
//                           ? (isDelivered ? Icons.check_circle : Icons.delivery_dining)
//                           : Icons.access_time,
//                       color: acceptedStatus
//                           ? (isDelivered ? Colors.green : Colors.yellow.shade900)
//                           : Colors.red,
//                     ),
//                   ),
//                   title: Text(
//                     acceptedStatus
//                         ? (isDelivered ? 'Delivered' : 'Accepted')
//                         : 'Pending',
//                     style: TextStyle(
//                       color: acceptedStatus
//                           ? (isDelivered ? Colors.green : Colors.yellow.shade900)
//                           : Colors.red,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Customer: ${orderData['fullName'] ?? 'Unknown Customer'}'),
//                       Text('Product: ${orderData['productName']}'),
//                       Text('Quantity: ${orderData['quantity']}'),
//                     ],
//                   ),
//                 ),
//                 // Approve/Reject buttons for Pending Orders only
//                 if (!acceptedStatus)
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () async {
//                           await FirebaseFirestore.instance
//                               .collection('orders')
//                               .doc(orderData['orderId'])
//                               .update({'accepted': true});
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blueGrey,
//                         ),
//                         child: Text(
//                           'Approve',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       ElevatedButton(
//                         onPressed: () async {
//                           await FirebaseFirestore.instance
//                               .collection('orders')
//                               .doc(orderData['orderId'])
//                               .update({'accepted': false});
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.redAccent,
//                         ),
//                         child: Text(
//                           'Reject',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ),
//                     ],
//                   ),
//                 // Delivered button for Accepted Orders only
//                 if (acceptedStatus && !isDelivered)
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () async {
//                           await FirebaseFirestore.instance
//                               .collection('orders')
//                               .doc(orderData['orderId'])
//                               .update({'delivered': true});
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.green,
//                         ),
//                         child: Text(
//                           'Mark as Delivered',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//               ],
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class VendorOrderScreen extends StatelessWidget {
  String formattedDate(date) {
    final outputDateFormat = DateFormat('dd/MM/yyyy');
    return outputDateFormat.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade900,
          elevation: 0,
          title: const Text(
            'My Orders',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 5,
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Accepted'),
              Tab(text: 'Pending'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            OrdersList(acceptedStatus: true),
            OrdersList(acceptedStatus: false),
          ],
        ),
      ),
    );
  }
}

class OrdersList extends StatefulWidget {
  final bool acceptedStatus;

  const OrdersList({Key? key, required this.acceptedStatus}) : super(key: key);

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  bool _isLoading = false;

  Future<void> _updateOrder(BuildContext context, String documentId, Map<String, dynamic> data) async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await FirebaseFirestore.instance
          .collection('orders')
          .doc(documentId)
          .update(data);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              data.containsKey('delivered')
                  ? 'Order marked as delivered'
                  : data['accepted']
                      ? 'Order approved successfully'
                      : 'Order rejected successfully',
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      print('Error updating order: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update order: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _ordersStream = FirebaseFirestore.instance
        .collection('orders')
        .where('vendorId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('accepted', isEqualTo: widget.acceptedStatus)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _ordersStream,
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
          return Center(
            child: Text(
              'No ${widget.acceptedStatus ? 'Accepted' : 'Pending'} Orders',
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            final DocumentSnapshot document = snapshot.data!.docs[index];
            final orderData = document.data() as Map<String, dynamic>;
            final isDelivered = orderData['delivered'] == true;
            final documentId = document.id;

            return Card(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 14,
                      child: Icon(
                        widget.acceptedStatus
                            ? (isDelivered
                                ? Icons.check_circle
                                : Icons.delivery_dining)
                            : Icons.access_time,
                        color: widget.acceptedStatus
                            ? (isDelivered
                                ? Colors.green
                                : Colors.yellow.shade900)
                            : Colors.red,
                      ),
                    ),
                    title: Text(
                      widget.acceptedStatus
                          ? (isDelivered ? 'Delivered' : 'Accepted')
                          : 'Pending',
                      style: TextStyle(
                        color: widget.acceptedStatus
                            ? (isDelivered
                                ? Colors.green
                                : Colors.yellow.shade900)
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Customer: ${orderData['fullName'] ?? 'Unknown Customer'}'),
                        Text('Product: ${orderData['productName'] ?? 'Unknown Product'}'),
                        Text('Quantity: ${orderData['quantity'] ?? 'N/A'}'),
                        if (orderData['orderDate'] != null)
                          Text(
                              'Order Date: ${DateFormat('dd/MM/yyyy').format(orderData['orderDate'].toDate())}'),
                      ],
                    ),
                  ),
                  if (!widget.acceptedStatus)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: _isLoading
                                ? null
                                : () => _updateOrder(
                                      context,
                                      documentId,
                                      {'accepted': true},
                                    ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey,
                              disabledBackgroundColor: Colors.grey,
                            ),
                            child: _isLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text(
                                    'Approve',
                                    style: TextStyle(color: Colors.black),
                                  ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: _isLoading
                                ? null
                                : () => _updateOrder(
                                      context,
                                      documentId,
                                      {'accepted': false},
                                    ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              disabledBackgroundColor: Colors.grey,
                            ),
                            child: const Text(
                              'Reject',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (widget.acceptedStatus && !isDelivered)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: _isLoading
                            ? null
                            : () => _updateOrder(
                                  context,
                                  documentId,
                                  {'delivered': true},
                                ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          disabledBackgroundColor: Colors.grey,
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              )
                            : const Text(
                                'Mark as Delivered',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}