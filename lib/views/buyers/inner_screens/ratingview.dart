
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // Import the package

class RatingViewPage extends StatelessWidget {
  final Stream<QuerySnapshot> _deliveredOrdersStream = FirebaseFirestore.instance
      .collection('orders')
      .where('buyerId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .where('delivered', isEqualTo: true)
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
  TextEditingController _reviewController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Rate and Review the Product'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Please rate your experience:'),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 0,
              itemSize: 40,
              itemCount: 5,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                _rating = rating;
              },
            ),
            const SizedBox(height: 16),
            const Text('Write your review:'),
            TextField(
              controller: _reviewController,
              decoration: InputDecoration(
                hintText: 'Your review here...',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
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
            onPressed: () async {
              // Add rating and review to Firestore
              try {
                await FirebaseFirestore.instance
                    .collection('orders')
                    .doc(orderId)
                    .update({
                  'rating': _rating,
                  'review': 
                  _reviewController.text,
                });

                // Show success message after review is submitted
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Thank you for your review!'),
                    backgroundColor: Color.fromARGB(255, 219, 15, 11),
                  ),
                );
              } catch (e) {
                // Show error message if something goes wrong
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Failed to submit your review: $e'),
                    backgroundColor: Colors.red,
                  ),
                );
              }

              Navigator.pop(context); // Close the dialog after submission
            },
            child: const Text('Submit'),
          ),
        ],
      );
    },
  );
}
}