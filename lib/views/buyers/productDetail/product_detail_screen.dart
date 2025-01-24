

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:intl/intl.dart';
import 'package:winkle_final/provider/cart_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final dynamic productData;

  const ProductDetailScreen({super.key, this.productData});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _imageIndex = 0;
  String? _selectedSize;
  DateTime? _selectedShippingDate;
  String formatedDate(DateTime date) {
    final outPutDateFormat = DateFormat('dd/MM/yyyy');
    final outPutDate = outPutDateFormat.format(date);
    return outPutDate;
  }
void _pickShippingDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedShippingDate = pickedDate;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade200,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          widget.productData['productName'],
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child: PhotoView(
                      imageProvider: NetworkImage(
                          widget.productData['imageUrl'][_imageIndex])),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.productData['imageUrl'].length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            //inkwell le hamile kunai pic ma click gare vane teslai thuko size ma dekhauxa
                            onTap: () {
                              setState(() {
                                _imageIndex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.red.shade200),
                                ),
                                height: 60,
                                width: 60,
                                child: Image.network(
                                    widget.productData['imageUrl'][index]),
                              ),
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Text(
                '\$' +
                    ' ' +
                    widget.productData['productPrice'].toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 22,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade300,
                ),
              ),
            ),
            Text(
              widget.productData['productName'],
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 4,
                fontWeight: FontWeight.bold,
              ),
            ),
            ExpansionTile(
              // view more gare tesko hidden content dekhauxa expansion tile le
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Description',
                      style: TextStyle(color: Colors.red.shade300),
                    ),
                    Text(
                      'View more',
                      style: TextStyle(color: Colors.red.shade300),
                    ),
                  ],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.productData['description'],
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black26,
                        letterSpacing: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Choose Shipping Date:',
                    style: TextStyle(
                      color: Colors.yellow.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
             
                   OutlinedButton(
                    onPressed: _pickShippingDate,
                    child: Text(
                      _selectedShippingDate == null
                          ? 'Select Date'
                          : formatedDate(_selectedShippingDate!),
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ExpansionTile(
              title: Text(
                'Available Size',
              ),
              children: [
                Container(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.productData['sizeList'].length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _selectedSize =
                                    widget.productData['sizeList'][index];
                              });
                              print(_selectedSize);
                            },
                            child: Text(
                              widget.productData['sizeList'][index],
                            ),
                          ),
                        );
                      }),
                )
              ],
            )
          ],
        ),
      ),
    
      bottomSheet: GestureDetector(
        //hmaile add ta cart garda gesturedetector le valiudation triiger garxa like size choos egare ki nai etc gesture handle garxa
        onTap: () {
          if (_selectedSize == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Please select a size before adding to cart."),
              ),
            );
            return;
          }
    
          final cartProvider =
              Provider.of<CartProvider>(context, listen: false);
          cartProvider.addProductToCart(
            widget.productData['productName'],
            widget.productData['productId'],
            widget.productData['imageUrl'],
            widget.productData['productPrice'] is int
                ? widget.productData['productPrice'].toDouble()
                : widget.productData['productPrice'],
            1,
            widget.productData['quantity'],
            widget.productData['vendorId'],
            _selectedSize!,
            widget.productData['scheduleDate'],
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Product added to cart!"),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.red.shade400,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    CupertinoIcons.cart,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Add To Cart',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 3),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class ProductDetailScreen extends StatefulWidget {
//   final dynamic productData;

//   const ProductDetailScreen({super.key, this.productData});

//   @override
//   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   int _imageIndex = 0;
//   String? _selectedSize;
//   DateTime? _selectedShippingDate;
//   String formatedDate(DateTime date) {
//     final outPutDateFormat = DateFormat('dd/MM/yyyy');
//     final outPutDate = outPutDateFormat.format(date);
//     return outPutDate;
//   }

//   void _pickShippingDate() async {
//     final pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(Duration(days: 30)),
//     );

//     if (pickedDate != null) {
//       setState(() {
//         _selectedShippingDate = pickedDate;
//       });
//     }
//   }

//   Future<List<Map<String, dynamic>>> _fetchReviews() async {
//     final snapshot = await FirebaseFirestore.instance
//         .collection('orders')
//         .where('productId', isEqualTo: widget.productData['productId'])
//         .where('orderId', isEqualTo:widget.productData['orderId'])
//         .where('review', isNotEqualTo: null)
//         .get();

//     return snapshot.docs
//         .map((doc) => {
//               'rating': doc['rating'],
//               'review': doc['review'],
//               'user': doc['buyerName'], // Assuming buyerName is stored in the order
//             })
//         .toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red.shade200,
//         iconTheme: IconThemeData(
//           color: Colors.black,
//         ),
//         title: Text(
//           widget.productData['productName'],
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 3,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: 300,
//                   width: double.infinity,
//                   child: PhotoView(
//                       imageProvider: NetworkImage(
//                           widget.productData['imageUrl'][_imageIndex])),
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   child: Container(
//                     height: 50,
//                     width: MediaQuery.of(context).size.width,
//                     child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: widget.productData['imageUrl'].length,
//                         itemBuilder: (context, index) {
//                           return InkWell(
//                             onTap: () {
//                               setState(() {
//                                 _imageIndex = index;
//                               });
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   border:
//                                       Border.all(color: Colors.red.shade200),
//                                 ),
//                                 height: 60,
//                                 width: 60,
//                                 child: Image.network(
//                                     widget.productData['imageUrl'][index]),
//                               ),
//                             ),
//                           );
//                         }),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(0.0),
//               child: Text(
//                 '\$' +
//                     ' ' +
//                     widget.productData['productPrice'].toStringAsFixed(2),
//                 style: TextStyle(
//                   fontSize: 22,
//                   letterSpacing: 4,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.red.shade300,
//                 ),
//               ),
//             ),
//             Text(
//               widget.productData['productName'],
//               style: TextStyle(
//                 fontSize: 16,
//                 letterSpacing: 4,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             ExpansionTile(
//                 title: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Product Description',
//                       style: TextStyle(color: Colors.red.shade300),
//                     ),
//                     Text(
//                       'View more',
//                       style: TextStyle(color: Colors.red.shade300),
//                     ),
//                   ],
//                 ),
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       widget.productData['description'],
//                       style: TextStyle(
//                         fontSize: 17,
//                         color: Colors.black26,
//                         letterSpacing: 8,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ]),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(
//                     'Choose Shipping Date:',
//                     style: TextStyle(
//                       color: Colors.yellow.shade900,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14,
//                     ),
//                   ),
//                   OutlinedButton(
//                     onPressed: _pickShippingDate,
//                     child: Text(
//                       _selectedShippingDate == null
//                           ? 'Select Date'
//                           : formatedDate(_selectedShippingDate!),
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 4,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ExpansionTile(
//               title: Text(
//                 'Available Size',
//               ),
//               children: [
//                 Container(
//                   height: 50,
//                   child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: widget.productData['sizeList'].length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: OutlinedButton(
//                             onPressed: () {
//                               setState(() {
//                                 _selectedSize =
//                                     widget.productData['sizeList'][index];
//                               });
//                               print(_selectedSize);
//                             },
//                             child: Text(
//                               widget.productData['sizeList'][index],
//                             ),
//                           ),
//                         );
//                       }),
//                 )
//               ],
//             ),
           
//             FutureBuilder<List<Map<String, dynamic>>>(
//               future: _fetchReviews(),
          
//               builder: (context, snapshot) {
//   if (snapshot.connectionState == ConnectionState.waiting) {
//     return CircularProgressIndicator();
//   }
//   if (!snapshot.hasData || snapshot.data!.isEmpty) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Text('No reviews available', style: TextStyle(color: Colors.grey)),
//     );
//   }
//   final reviews = snapshot.data!;
//   return Column(
//     children: [
//       SizedBox(height: 20),
//       Text(
//         'Reviews',
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//           color: Colors.red.shade300,
//         ),
//       ),
//       ...reviews.map((review) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Icon(
//                     Icons.star,
//                     color: Colors.amber,
//                     size: 20,
//                   ),
//                   Text(
//                     ' ${review['rating']}',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 4),
//               Text(
//                 review['review'],
//                 style: TextStyle(fontSize: 14, color: Colors.black54),
//               ),
//               SizedBox(height: 8),
//             ],
//           ),
//         );
//       }).toList(),
//     ],
//   );
// },

//             ),
//           ],
//         ),
//       ),
//       bottomSheet: GestureDetector(
//         onTap: () {
//           if (_selectedSize == null) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text("Please select a size before adding to cart."),
//               ),
//             );
//             return;
//           }

//           final cartProvider =
//               Provider.of<CartProvider>(context, listen: false);
//           cartProvider.addProductToCart(
//             widget.productData['productName'],
//             widget.productData['productId'],
//             widget.productData['imageUrl'],
//             widget.productData['productPrice'] is int
//                 ? widget.productData['productPrice'].toDouble()
//                 : widget.productData['productPrice'],
//             1,
//             widget.productData['quantity'],
//             widget.productData['vendorId'],
//             _selectedSize!,
//             widget.productData['scheduleDate'],
//           );
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text("Product added to cart!"),
//             ),
//           );
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             height: 50,
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//               color: Colors.red.shade400,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Icon(
//                     CupertinoIcons.cart,
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     'Add To Cart',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                         letterSpacing: 3),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
