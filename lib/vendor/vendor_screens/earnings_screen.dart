import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:winkle_final/vendor/vendor_screens/vendor_inner_screen/withdrawal_screen.dart';

// class EarningsScreen extends StatelessWidget {
//   const EarningsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users =
//         FirebaseFirestore.instance.collection('vendors');

//     final Stream<QuerySnapshot> _ordersStream = FirebaseFirestore.instance
//         .collection('orders')
//         .where('vendorId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//         .snapshots();

//     return FutureBuilder<DocumentSnapshot>(
//   future: users.doc(FirebaseAuth.instance.currentUser!.uid).get(),
//   builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//     // Handle errors in fetching document
//     if (snapshot.hasError) {
//       return Center(child: Text("Error: ${snapshot.error}"));
//     }

//     // Handle case where document does not exist
//     if (snapshot.hasData && !snapshot.data!.exists) {
//       return Center(child: Text("No data found for this user. Please ensure your profile is set up."));
//     }

//     // Handle case when data is successfully fetched
//     if (snapshot.connectionState == ConnectionState.done) {
//       Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
//       // Proceed with the data rendering
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: Row(
//             children: [
//               CircleAvatar(
//                 backgroundImage: NetworkImage(data['storeImage']),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   'Hi ' + data['bussinessName'],
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                     letterSpacing: 4,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//         body: StreamBuilder<QuerySnapshot>(
//           stream: _ordersStream,
//           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.hasError) {
//               return Center(child: Text('Something went wrong with orders.'));
//             }
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             }

//             double totalOrder = 0.0;
//             for (var orderItem in snapshot.data!.docs) {
//               totalOrder += orderItem['quantity'] * orderItem['productPrice'];
//             }

//             return Padding(
//               padding: const EdgeInsets.all(14.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     height: 150,
//                     width: MediaQuery.of(context).size.width * 0.5,
//                     decoration: BoxDecoration(
//                       color: Colors.yellow.shade900,
//                       borderRadius: BorderRadius.circular(32),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Text(
//                             'TOTAL EARNINGS',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Text(
//                             '\$' + " " + totalOrder.toStringAsFixed(2),
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     height: 150,
//                     width: MediaQuery.of(context).size.width * 0.5,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(32),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Text(
//                             'TOTAL ORDERS',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Text(
//                             snapshot.data!.docs.length.toString(),
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       );
//     }

//     // Return loading indicator if data is still being fetched
//     return Center(child: CircularProgressIndicator());
//   },
// );


class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  Future<double> calculateTotalEarnings() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('orders')
          .where('vendorId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where('delivered', isEqualTo: true)
          .get();

      // Calculate the total earnings for delivered orders
      double totalEarnings = querySnapshot.docs.fold(0.0, (sum, doc) {
        final productPrice = doc['productPrice'] ?? 0.0;
        final quantity = doc['quantity'] ?? 1;
        return sum + (productPrice * quantity);
      });

      return totalEarnings;
    } catch (e) {
      debugPrint('Error fetching orders: $e');
      throw Exception('Failed to fetch orders.');
    }
  }

  Future<int> calculateTotalDeliveredOrders() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('orders')
          .where('vendorId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where('delivered', isEqualTo: true)
          .get();

      return querySnapshot.docs.length;
    } catch (e) {
      debugPrint('Error fetching orders: $e');
      throw Exception('Failed to fetch orders.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        calculateTotalEarnings(),
        calculateTotalDeliveredOrders(),
      ]),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                "Earnings",
                style: TextStyle(color: Colors.black),
              ),
              iconTheme: const IconThemeData(color: Colors.black),
            ),
            body: Center(child: Text("Something went wrong")),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                "Earnings",
                style: TextStyle(color: Colors.black),
              ),
              iconTheme: const IconThemeData(color: Colors.black),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final double totalEarnings = snapshot.data![0] as double;
        final int totalDeliveredOrders = snapshot.data![1] as int;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              "Earnings",
              style: TextStyle(color: Colors.black),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade900,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'TOTAL EARNINGS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '\$${totalEarnings.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'TOTAL ORDERS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '$totalDeliveredOrders',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

