import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../productDetail/product_detail_screen.dart';

// class AllProductScreen extends StatelessWidget {
//   final dynamic categoryData;

//   const AllProductScreen({super.key, required this.categoryData, required categoryName});

//   @override
//   Widget build(BuildContext context) {
//     final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
//         .collection('products')
//         .where('category', isEqualTo: categoryData['categoryName'])
//         .where('approved', isEqualTo: true)
//         .snapshots();

//     return Scaffold(
//       appBar: AppBar(
//         elevation: 1,
//         backgroundColor: Colors.yellow.shade900,
//         title: Text(
//           categoryData['categoryName'],
//           style: TextStyle(
//             letterSpacing: 6,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _productsStream,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text('Something went wrong'));
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(color: Colors.yellow.shade900),
//             );
//           }

//           return GridView.builder(
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
//               });
//         },
//       ),
//     );
//   }
// }


class AllProductScreen extends StatelessWidget {
  final String categoryName;
  //final String imageUrl;

  const AllProductScreen({
    super.key,
    required this.categoryName,
    //required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
        .collection('products')
        .where('category', isEqualTo: categoryName)
        // .where('approved', isEqualTo: true)
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color.fromARGB(255, 116, 86, 54),
        title: Text(
          categoryName,
          style: const TextStyle(
            letterSpacing: 6,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Display the category image
          // Container(
          //   height: 150,
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: NetworkImage(imageUrl),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          const SizedBox(height: 10),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _productsStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.yellow.shade900,
                    ),
                  );
                }

                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'No products found for this category.',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }

                return GridView.builder(
                  itemCount: snapshot.data!.size,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 200 / 300,
                  ),
                  itemBuilder: (context, index) {
                    final productData = snapshot.data!.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ProductDetailScreen(
                                productData: productData,
                              );
                            },
                          ),
                        );
                      },
                      child: Card(
                        elevation: 5,
                        margin: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 150,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        productData['imageUrl'][0],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                productData['productName'],
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                '\$${productData['productPrice'].toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  color: Colors.yellow.shade900,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}