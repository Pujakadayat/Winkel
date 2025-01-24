
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:winkle_final/views/buyers/productDetail/product_detail_screen.dart';


// class MainProductsWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
//         .collection('products')
//         .where('approved', isEqualTo: true)
//         .snapshots();
//     return StreamBuilder<QuerySnapshot>(
//       stream: _productsStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: LinearProgressIndicator(
//               color: Colors.yellow.shade900,
//             ),
//           );
//         }

//         return Container(
//           height: 250,
//           child: GridView.builder(
//               itemCount: snapshot.data!.size,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 8,
//                   crossAxisSpacing: 8,
//                   childAspectRatio: 200 / 300),
//               itemBuilder: (context, index) {
//                 final productData = snapshot.data!.docs[index];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) {
//                       return ProductDetailScreen(
//                         productData: productData,
//                       );
//                     }));
//                   },
//                   child: Card(
//                     child: Column(
//                       children: [
//                         Stack(
//                           children: [
//                             Container(
//                               height: 170,
//                               width: 200,
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                   image: NetworkImage(
//                                     productData['imageUrl'][0],
//                                   ),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             productData['productName'],
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: 4,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             '\$' +
//                                 " " +
//                                 productData['productPrice'].toStringAsFixed(2),
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: 4,
//                               color: Colors.yellow.shade900,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//         );
//       },
//     );
//   }
// }

// class MainProductsWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
//         .collection('products')
//         // .where('category', isEqualTo: categoryName)
//         // .where('approved', isEqualTo: true)
//         .snapshots();

//     return StreamBuilder<QuerySnapshot>(
//       stream: _productsStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: LinearProgressIndicator(
//               color: Colors.amber,
//             ),
//           );
//         }

//         return Container(
//           height: 270,
//           child: ListView.separated(
//             scrollDirection: Axis.horizontal,
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               final productData = snapshot.data!.docs[index];
// final productId = productData.id;
//    final ratingStream = FirebaseFirestore.instance
//                   .collection('orders')
//                   .where('productId', isEqualTo: productId)
//                   .where('rating', isGreaterThanOrEqualTo: 0) // Only include orders with a rating
//                   .snapshots();
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     return ProductDetailScreen(productData: productData);
//                   }));
//                 },
//                 child: Card(
//                   child: Column(
//                     children: [
//                       Container(
//                         height: 170,
//                         width: 200,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: NetworkImage(productData['imageUrl'][0]),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           productData['productName'],
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           '\$${productData['productPrice'].toStringAsFixed(2)}',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.red,
//                           ),
//                         ),
                        
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//             separatorBuilder: (context, _) => SizedBox(width: 15),
//           ),
//         );
//       },
//     );
//   }
// }

class MainProductsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
        .collection('products')
        // .where('category', isEqualTo: categoryName)
        // .where('approved', isEqualTo: true)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _productsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: LinearProgressIndicator(
              color: Colors.amber,
            ),
          );
        }

        return Container(
          height: 270,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final productData = snapshot.data!.docs[index];
              final productId = productData.id;
              final ratingStream = FirebaseFirestore.instance
                  .collection('orders')
                  .where('productId', isEqualTo: productId)
                  .where('rating', isGreaterThanOrEqualTo: 0) // Only include orders with a rating
                  .snapshots();

              // Access product data using data() and check for 'imageUrl' field
              final productMap = productData.data() as Map<String, dynamic>;
              final imageUrl = productMap.containsKey('imageUrl') && productMap['imageUrl'].isNotEmpty
                               ? productMap['imageUrl'][0]
                               : 'https://via.placeholder.com/150'; // Fallback placeholder image

              // Check for null or missing price and provide a fallback value
              final productPrice = productMap['productPrice'] != null
                  ? productMap['productPrice']
                  : 0.0; // Fallback to 0.0 if price is null

              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProductDetailScreen(productData: productData);
                  }));
                },
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        height: 170,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          productMap['productName'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Row to display price and rating in the same line
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${productPrice.toStringAsFixed(2)}', // Safely call toStringAsFixed
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            // Display RatingBar with default rating, but make it non-interactive
                            RatingBar.builder(
                              initialRating: 3.0,  // Default rating of 3 stars
                              minRating: 1,
                              itemSize: 20,
                              itemCount: 5,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              ignoreGestures: true,  // Disable interaction with the rating bar
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (_) {}, // Empty function since we don't need interaction
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, _) => SizedBox(width: 15),
          ),
        );
      },
    );
  }
}
