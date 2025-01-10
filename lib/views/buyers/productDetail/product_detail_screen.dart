// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:photo_view/photo_view.dart';

// // class ProductDetailScreen extends StatefulWidget {
// // final dynamic productData;

// //   const ProductDetailScreen({super.key, this.productData});

// //   @override
// //   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// // }

// // class _ProductDetailScreenState extends State<ProductDetailScreen> {
// //   int _imageIndex =0;
// //   String? _selectedSize;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.red.shade200,
// //         iconTheme: IconThemeData(
// //           color: Colors.black,
// //         ),
// //         title: Text(
// //           widget.productData['productName'],
// //         style:TextStyle(
// //           color: Colors.black,
// //           fontSize: 18,
// //           fontWeight: FontWeight.bold,
// //           letterSpacing: 3,
// //         ) ,
// //         ),
// //       ),

// //       body: SingleChildScrollView(
        
// //         child: Column(
// //           children: [
// //             Stack(
// //               children: [
// //             Container(
// //               height: 300,
// //               width: double.infinity,
// //               child: PhotoView(
// //                 imageProvider: (widget.productData['imageUrl'][_imageIndex])),
// //             ),
// //             Positioned(
// //               bottom: 0,
// //               child:Container(
// //                 height: 50,
// //                 width: MediaQuery.of(context).size.width,
// //                 child: ListView.builder(
// //             scrollDirection: Axis.horizontal,
// //             itemCount: widget.productData['imageUrl'].length,
// //             itemBuilder: (context, index){
// //               return InkWell(
// //                 onTap: (){
// //                   setState(() {
// //                    _imageIndex= index; 
// //                   });
// //                 },
// //                 child: Container(
// //                   decoration: BoxDecoration(
// //                     border: Border.all(color: Colors.red.shade200),
// //                   ),
// //                   height: 60,
// //                   width: 60,
// //                   child: Image.network(widget.productData['imageUrl'][index]),
// //                 ),
// //               );
// //             }
// //                 ),
// //                 ),
// //                 )
// //               ],
// //             ),
// //             SizedBox(height: 20,),
// //             Padding(
// //               padding: const EdgeInsets.all(10.0),
// //               child: Text(
// //                 '\$' + ' ' +widget.productData['productPrice'].toStringAsFixed(2),
// //               style:TextStyle(
// //                 fontSize: 22,
// //                 letterSpacing: 4,
// //                 fontWeight: FontWeight.bold,
// //                 color: Colors.red.shade300,
// //               ) ,
// //               ),
// //             ),
// //              Text(widget.productData['productName'],
// //             style:TextStyle(
// //               fontSize: 22,
// //               letterSpacing: 4,
// //               fontWeight: FontWeight.bold,
// //             ) ,
// //             ),
// //             ExpansionTile(
// //               title: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //            children: [
// //             Text('Product Description',style: TextStyle(color: Colors.red.shade300),),
// //             Text('View more',style: TextStyle(color: Colors.red.shade300),),
// //            ],
// //               ),
// //               children: [
// //                 Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Text(widget.productData[
// //                     'description'],
// //                     style: TextStyle(
// //                       fontSize: 17,
// //                       color: Colors.black26
                          
// //                   ),
// //                   textAlign: TextAlign.center,
// //                   ),
// //                 ),
// //                 ExpansionTile(
// //                   title: Text('Available Size',),
// //                   children: [
// //                     Container(
// //                       height: 50,
// //                       child: ListView.builder(
// //                         scrollDirection: Axis.horizontal,
// //                         itemCount:widget.productData['sizeList'].length ,
// //                         itemBuilder: (context, index){
// // return Padding(
// //   padding: const EdgeInsets.all(8.0),
// //   child: OutlinedButton(onPressed: (){
// //     setState(() {
// //       _selectedSize = widget.productData['sizedList'][index];
// //     });
// //     print(_selectedSize);
// //   },
// //    child:Text(widget.productData['sizeList'][index],
// //    ),
// //    ),
// // );
// //                         }
// //                       ),
// //                       )
// //                   ],
// //                 )
// //               ],
// //               ),
// //           ],
// //         ),
// //       ),
// //       bottomSheet:Padding(
// //         padding: const EdgeInsets.all(8.0),
// //         child: Container(
// //           height: 50,
// //           width: MediaQuery.of(context).size.width,
// //           decoration: BoxDecoration(
// //             color:Colors.red.shade400,
// //             borderRadius: BorderRadius.circular(10),
// //           ),
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Padding(
// //                 padding: const EdgeInsets.all(10.0),
// //                 child: Icon(CupertinoIcons.cart,
// //                 color: Colors.white10,
// //                 size: 26,
// //                 ),
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: Text('Add To Cart',style: TextStyle(
// //                   color:Colors.white,
// //                   fontWeight: FontWeight.bold,
// //                   fontSize: 18,
// //                   letterSpacing: 3),),
// //               ),
// //             ],
// //           ),
// //         ),
// //       )
// //     );
// //   }
// // }
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:multi_vendor_app/provider/cart_provider.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

// class ProductDetailScreen extends StatefulWidget {
//   final dynamic productData;

//   const ProductDetailScreen({super.key, this.productData});

//   @override
//   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   int _imageIndex = 0;
//   String? _selectedSize;
//   String formatedDate(date) {
//     final outPutDateFormat = DateFormat('dd/MM/yyyy');
//     final outPutDate = outPutDateFormat.format(date);
//     return outPutDate;
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
//               padding: const EdgeInsets.all(10.0),
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
//                 fontSize: 22,
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
//                     'This Product will be shipping on',
//                     style: TextStyle(
//                       color: Colors.yellow.shade900,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14,
//                     ),
//                   ),
//                   Text(
//                     formatedDate(
//                       widget.productData['scheduleDate'].toDate(),
//                     ),
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 4,
//                     ),
//                   )
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
//             )
//           ],
//         ),
//       ),
//       // bottomSheet: Padding(
//       //   padding: const EdgeInsets.all(8.0),
//       //   child: Container(
//       //     height: 50,
//       //     width: MediaQuery.of(context).size.width,
//       //     decoration: BoxDecoration(
//       //       color: Colors.red.shade400,
//       //       borderRadius: BorderRadius.circular(10),
//       //     ),
//       //     child: Row(
//       //       mainAxisAlignment: MainAxisAlignment.center,
//       //       children: [
//       //         Padding(
//       //           padding: const EdgeInsets.all(10.0),
//       //           child: Icon(
//       //             CupertinoIcons.cart,
//       //             color: Colors.white10,
//       //             size: 10,
//       //           ),
//       //         ),
//       //         Padding(
//       //           padding: const EdgeInsets.all(8.0),
//       //           child: Text(
//       //             'Add To Cart',
//       //             style: TextStyle(
//       //                 color: Colors.white,
//       //                 fontWeight: FontWeight.bold,
//       //                 fontSize: 18,
//       //                 letterSpacing: 3),
//       //           ),
//       //         ),
//       //       ],
//       //     ),
//       //   ),
//       // )
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

//           // CartProvider.addProductToCart(
//           //   widget.productData['productName'],
//           //   widget.productData['productId'],
//           //   widget.productData['imageUrl'],
//           //   widget.productData['productPrice'],
//           //   1,
//           //   widget.productData['vendorId'],
//           //   _selectedSize!,
//           //   widget.productData['scheduleDate'],
//           // );
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
// // }
import 'package:cloud_firestore_platform_interface/src/timestamp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// class ProductDetailScreen extends StatefulWidget {
//   final dynamic productData;

//   const ProductDetailScreen({super.key, this.productData});

//   @override
//   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   int _imageIndex = 0;
//   String? _selectedSize;
//   String formatedDate(date) {
//     final outPutDateFormat = DateFormat('dd/MM/yyyy');
//     final outPutDate = outPutDateFormat.format(date);
//     return outPutDate;
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
//               padding: const EdgeInsets.all(10.0),
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
//                 fontSize: 22,
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
//                     'This Product will be shipping on',
//                     style: TextStyle(
//                       color: Colors.yellow.shade900,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14,
//                     ),
//                   ),
//                   Text(
//                     formatedDate(
//                       widget.productData['scheduleDate'].toDate(),
//                     ),
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 4,
//                     ),
//                   )
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
//             )
//           ],
//         ),
//       ),
//       // bottomSheet: Padding(
//       //   padding: const EdgeInsets.all(8.0),
//       //   child: Container(
//       //     height: 50,
//       //     width: MediaQuery.of(context).size.width,
//       //     decoration: BoxDecoration(
//       //       color: Colors.red.shade400,
//       //       borderRadius: BorderRadius.circular(10),
//       //     ),
//       //     child: Row(
//       //       mainAxisAlignment: MainAxisAlignment.center,
//       //       children: [
//       //         Padding(
//       //           padding: const EdgeInsets.all(10.0),
//       //           child: Icon(
//       //             CupertinoIcons.cart,
//       //             color: Colors.white10,
//       //             size: 10,
//       //           ),
//       //         ),
//       //         Padding(
//       //           padding: const EdgeInsets.all(8.0),
//       //           child: Text(
//       //             'Add To Cart',
//       //             style: TextStyle(
//       //                 color: Colors.white,
//       //                 fontWeight: FontWeight.bold,
//       //                 fontSize: 18,
//       //                 letterSpacing: 3),
//       //           ),
//       //         ),
//       //       ],
//       //     ),
//       //   ),
//       // )
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

//           // CartProvider.addProductToCart(
//           //   widget.productData['productName'],
//           //   widget.productData['productId'],
//           //   widget.productData['imageUrl'],
//           //   widget.productData['productPrice'],
//           //   1,
//           //   widget.productData['vendorId'],
//           //   _selectedSize!,
//           //   widget.productData['scheduleDate'],
//           // );
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


// class ProductDetailScreen extends StatefulWidget {
//   final dynamic productData;

//   const ProductDetailScreen({super.key, this.productData});

//   @override
//   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   int _imageIndex = 0;
//   String? _selectedSize;
//   String formatedDate(date) {
//     final outPutDateFormat = DateFormat('dd/MM/yyyy');
//     final outPutDate = outPutDateFormat.format(date);
//     return outPutDate;
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
//               padding: const EdgeInsets.all(10.0),
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
//                 fontSize: 22,
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
//                     'This Product will be shipping on',
//                     style: TextStyle(
//                       color: Colors.yellow.shade900,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14,
//                     ),
//                   ),
//                   Text(
//                     formatedDate(
//                       widget.productData['scheduleDate'].toDate(),
//                     ),
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 4,
//                     ),
//                   )
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
//             )
//           ],
//         ),
//       ),
//       // bottomSheet: Padding(
//       //   padding: const EdgeInsets.all(8.0),
//       //   child: Container(
//       //     height: 50,
//       //     width: MediaQuery.of(context).size.width,
//       //     decoration: BoxDecoration(
//       //       color: Colors.red.shade400,
//       //       borderRadius: BorderRadius.circular(10),
//       //     ),
//       //     child: Row(
//       //       mainAxisAlignment: MainAxisAlignment.center,
//       //       children: [
//       //         Padding(
//       //           padding: const EdgeInsets.all(10.0),
//       //           child: Icon(
//       //             CupertinoIcons.cart,
//       //             color: Colors.white10,
//       //             size: 10,
//       //           ),
//       //         ),
//       //         Padding(
//       //           padding: const EdgeInsets.all(8.0),
//       //           child: Text(
//       //             'Add To Cart',
//       //             style: TextStyle(
//       //                 color: Colors.white,
//       //                 fontWeight: FontWeight.bold,
//       //                 fontSize: 18,
//       //                 letterSpacing: 3),
//       //           ),
//       //         ),
//       //       ],
//       //     ),
//       //   ),
//       // )
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

//           // CartProvider.addProductToCart(
//           //   widget.productData['productName'],
//           //   widget.productData['productId'],
//           //   widget.productData['imageUrl'],
//           //   widget.productData['productPrice'],
//           //   1,
//           //   widget.productData['vendorId'],
//           //   _selectedSize!,
//           //   widget.productData['scheduleDate'],
//           // );
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


// class ProductDetailScreen extends StatefulWidget {
//   final dynamic productData;

//   const ProductDetailScreen({super.key, this.productData});

//   @override
//   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   int _imageIndex = 0;
//   String? _selectedSize;
//   String formatedDate(date) {
//     final outPutDateFormat = DateFormat('dd/MM/yyyy');
//     final outPutDate = outPutDateFormat.format(date);
//     return outPutDate;
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
//               padding: const EdgeInsets.all(10.0),
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
//                 fontSize: 22,
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
//                     'This Product will be shipping on',
//                     style: TextStyle(
//                       color: Colors.yellow.shade900,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14,
//                     ),
//                   ),
//                   Text(
//                     formatedDate(
//                       widget.productData['scheduleDate'].toDate(),
//                     ),
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 4,
//                     ),
//                   )
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
//             )
//           ],
//         ),
//       ),
//       // bottomSheet: Padding(
//       //   padding: const EdgeInsets.all(8.0),
//       //   child: Container(
//       //     height: 50,
//       //     width: MediaQuery.of(context).size.width,
//       //     decoration: BoxDecoration(
//       //       color: Colors.red.shade400,
//       //       borderRadius: BorderRadius.circular(10),
//       //     ),
//       //     child: Row(
//       //       mainAxisAlignment: MainAxisAlignment.center,
//       //       children: [
//       //         Padding(
//       //           padding: const EdgeInsets.all(10.0),
//       //           child: Icon(
//       //             CupertinoIcons.cart,
//       //             color: Colors.white10,
//       //             size: 10,
//       //           ),
//       //         ),
//       //         Padding(
//       //           padding: const EdgeInsets.all(8.0),
//       //           child: Text(
//       //             'Add To Cart',
//       //             style: TextStyle(
//       //                 color: Colors.white,
//       //                 fontWeight: FontWeight.bold,
//       //                 fontSize: 18,
//       //                 letterSpacing: 3),
//       //           ),
//       //         ),
//       //       ],
//       //     ),
//       //   ),
//       // )
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

//           // CartProvider.addProductToCart(
//           //   widget.productData['productName'],
//           //   widget.productData['productId'],
//           //   widget.productData['imageUrl'],
//           //   widget.productData['productPrice'],
//           //   1,
//           //   widget.productData['vendorId'],
//           //   _selectedSize!,
//           //   widget.productData['scheduleDate'],
//           // );
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
//   List<Map<String, dynamic>> reviews = [];
//   bool canWriteReview = false;
//   String formatedDate(date) {
//     final outPutDateFormat = DateFormat('dd/MM/yyyy');
//     final outPutDate = outPutDateFormat.format(date);
//     return outPutDate;
//   }

//     void _pickShippingDate() async {
//     final pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(Duration(days: 30)), // Allow up to 30 days
//     );

//     if (pickedDate != null) {
//       setState(() {
//         _selectedShippingDate = pickedDate;
//       });
//     }
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
//               padding: const EdgeInsets.all(10.0),
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
//                 fontSize: 22,
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
//                     'Choose shipping date',
//                     style: TextStyle(
//                       color: Colors.yellow.shade900,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14,
//                     ),
//                   ),
//                       OutlinedButton(
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
//                   // Text(
//                   //   formatedDate(
//                   //     widget.productData['scheduleDate'].toDate(),
//                   //   ),
//                   //   style: TextStyle(
//                   //     color: Colors.blue,
//                   //     fontSize: 15,
//                   //     fontWeight: FontWeight.bold,
//                   //     letterSpacing: 4,
//                   //   ),
//                   // )
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
//             )
//           ],
//         ),
//       ),
//       // bottomSheet: Padding(
//       //   padding: const EdgeInsets.all(8.0),
//       //   child: Container(
//       //     height: 50,
//       //     width: MediaQuery.of(context).size.width,
//       //     decoration: BoxDecoration(
//       //       color: Colors.red.shade400,
//       //       borderRadius: BorderRadius.circular(10),
//       //     ),
//       //     child: Row(
//       //       mainAxisAlignment: MainAxisAlignment.center,
//       //       children: [
//       //         Padding(
//       //           padding: const EdgeInsets.all(10.0),
//       //           child: Icon(
//       //             CupertinoIcons.cart,
//       //             color: Colors.white10,
//       //             size: 10,
//       //           ),
//       //         ),
//       //         Padding(
//       //           padding: const EdgeInsets.all(8.0),
//       //           child: Text(
//       //             'Add To Cart',
//       //             style: TextStyle(
//       //                 color: Colors.white,
//       //                 fontWeight: FontWeight.bold,
//       //                 fontSize: 18,
//       //                 letterSpacing: 3),
//       //           ),
//       //         ),
//       //       ],
//       //     ),
//       //   ),
//       // )
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

//           // CartProvider.addProductToCart(
//           //   widget.productData['productName'],
//           //   widget.productData['productId'],
//           //   widget.productData['imageUrl'],
//           //   widget.productData['productPrice'],
//           //   1,
//           //   widget.productData['vendorId'],
//           //   _selectedSize!,
//           //   widget.productData['scheduleDate'],
//           // );
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
//        Expanded(
//             child: ListView.builder(
//               itemCount: reviews.length,
//               itemBuilder: (context, index) {
//                 final review = reviews[index];
//                 return ListTile(
//                   title: Text('Rating: ${review['rating']}'),
//                   subtitle: Text(review['review']),
//                   trailing: Text(
//                     DateFormat.yMMMd().format(
//                       review['reviewDate'].toDate(),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           if (canWriteReview)
//             ReviewInputWidget(
//               onSubmit: submitReview,
//             )
//           else
//             Text('You can only write a review if you purchased this product.'),
        
//       );
  
//   }
// }


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

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   int _imageIndex = 0;
//   String? _selectedSize;
//   DateTime? _selectedShippingDate;
//   List<Map<String, dynamic>> reviews = [];
//   bool canWriteReview = false;

//   String formatedDate(DateTime date) {
//     final outPutDateFormat = DateFormat('dd/MM/yyyy');
//     return outPutDateFormat.format(date);
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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red.shade200,
//         iconTheme: IconThemeData(color: Colors.black),
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
//             // Product Images Section
//             Stack(
//               children: [
//                 Container(
//                   height: 300,
//                   width: double.infinity,
//                   child: PhotoView(
//                     imageProvider: NetworkImage(
//                         widget.productData['imageUrl'][_imageIndex]),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   child: Container(
//                     height: 50,
//                     width: MediaQuery.of(context).size.width,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: widget.productData['imageUrl'].length,
//                       itemBuilder: (context, index) {
//                         return InkWell(
//                           onTap: () {
//                             setState(() {
//                               _imageIndex = index;
//                             });
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.red.shade200),
//                               ),
//                               height: 60,
//                               width: 60,
//                               child: Image.network(
//                                   widget.productData['imageUrl'][index]),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(height: 20),
//             // Product Price Section
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Text(
//                 '\$ ${widget.productData['productPrice'].toStringAsFixed(2)}',
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
//                 fontSize: 22,
//                 letterSpacing: 4,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             // Product Description
//             ExpansionTile(
//               title: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Product Description',
//                     style: TextStyle(color: Colors.red.shade300),
//                   ),
//                   Text(
//                     'View more',
//                     style: TextStyle(color: Colors.red.shade300),
//                   ),
//                 ],
//               ),
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     widget.productData['description'],
//                     style: TextStyle(
//                       fontSize: 17,
//                       color: Colors.black26,
//                       letterSpacing: 8,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ],
//             ),
//             // Shipping Date Selection
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(
//                     'Choose shipping date',
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
//             // Available Sizes
//             ExpansionTile(
//               title: Text('Available Size'),
//               children: [
//                 Container(
//                   height: 50,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: widget.productData['sizeList'].length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         // child: OutlinedButton(
//                         //   onPressed: () {
//                         //     setState(() {
//                         //       _selectedSize =
//                         //           widget.productData['sizeList'][index];
//                         //     });
//                         //   },
//                         //   child: Text(
//                         //     widget.productData['sizeList'][index],
//                         child: Container(
//                             color: _selectedSize ==
//                                     widget.productData['sizeList'][index]
//                                 ? Colors.yellow.shade900
//                                 : null,
//                             child: OutlinedButton(
//                               onPressed: () {
//                                 setState(() {
//                                   _selectedSize =
//                                       widget.productData['sizeList'][index];
//                                 });

//                                 print(_selectedSize);
//                               },
//                               child: Text(
//                                 widget.productData['sizeList'][index],
//                           ),
//                         ),
//                       ),)
//                   ;
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             // Add To Cart Button
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GestureDetector(
//                 onTap: () {
//                   final cartProvider =
//                       Provider.of<CartProvider>(context, listen: false);
//                   cartProvider.addProductToCart(
//                     widget.productData['productName'],
//                     widget.productData['productId'],
//                     widget.productData['imageUrl'],
//                     widget.productData['businessName'],
//                     widget.productData['productPrice'] is int
//                         ? widget.productData['productPrice'].toDouble()
//                         : widget.productData['productPrice'],
//                     1,
//                     widget.productData['quantity'],
//                     widget.productData['vendorId'],
//                     _selectedSize ?? 'Default Size',
//                     widget.productData['scheduleDate'],
//                   );
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text("Product added to cart!")),
//                   );
//                 },
//                 child: Container(
//                   height: 50,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     color: Colors.red.shade400,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         CupertinoIcons.cart,
//                         color: Colors.white,
//                         size: 20,
//                       ),
//                       SizedBox(width: 8),
//                       Text(
//                         'Add To Cart',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                           letterSpacing: 3,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             // Reviews Section
//             if (reviews.isNotEmpty)
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: reviews.length,
//                 itemBuilder: (context, index) {
//                   final review = reviews[index];
//                   return ListTile(
//                     title: Text('Rating: ${review['rating']}'),
//                     subtitle: Text(review['review']),
//                     trailing: Text(
//                       DateFormat.yMMMd().format(review['reviewDate'].toDate()),
//                     ),
//                   );
//                 },
//               ),
//             if (canWriteReview)
//              ReviewInputWidget(
//   onSubmit: (String reviewText, int rating) {
//     setState(() {
//       reviews.add({
//         'review': reviewText,
//         'rating': rating,
//         'reviewDate': DateTime.now(), // Assuming you want to store the current date
//       });
//     });
//   },
// )
//             else
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   'You can only write a review if you purchased this product.',
//                   style: TextStyle(color: Colors.grey),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   int _imageIndex = 0;
//   String? _selectedSize;
//   DateTime? _selectedShippingDate;

//   String formattedDate(DateTime date) {
//     final outputDateFormat = DateFormat('dd/MM/yyyy');
//     return outputDateFormat.format(date);
//   }

//   void _pickShippingDate() async {
//     final pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(Duration(days: 30)), // Allow up to 30 days
//     );

//     if (pickedDate != null) {
//       setState(() {
//         _selectedShippingDate = pickedDate;
//       });
//     }
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
//           // widget.productData['productName']
//         'Product Name: ${widget.productData['productName']}'

//           ,
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
//             // Product image and thumbnail logic
//             Stack(
//               children: [
//                 Container(
//                   height: 300,
//                   width: double.infinity,
//                   child: PhotoView(
//                     imageProvider: NetworkImage(
//                       widget.productData['imageUrl'][_imageIndex],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   child: Container(
//                     height: 50,
//                     width: MediaQuery.of(context).size.width,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: widget.productData['imageUrl'].length,
//                       itemBuilder: (context, index) {
//                         return InkWell(
//                           onTap: () {
//                             setState(() {
//                               _imageIndex = index;
//                             });
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.red.shade200),
//                               ),
//                               height: 60,
//                               width: 60,
//                               child: Image.network(
//                                 widget.productData['imageUrl'][index],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             // Product price and name
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Text(
//                 '\$ ${widget.productData['productPrice'].toStringAsFixed(2)}',
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
//                 fontSize: 22,
//                 letterSpacing: 4,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             // Product description
//             ExpansionTile(
//               title: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Product Description',
//                     style: TextStyle(color: Colors.red.shade300),
//                   ),
//                   Text(
//                     'View more',
//                     style: TextStyle(color: Colors.red.shade300),
//                   ),
//                 ],
//               ),
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     widget.productData['description'],
//                     style: TextStyle(
//                       fontSize: 17,
//                       color: Colors.black26,
//                       letterSpacing: 8,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ],
//             ),
//             // Shipping date picker
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
//                           : formattedDate(_selectedShippingDate!),
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
//             // Size selection
//             ExpansionTile(
//               title: Text('Available Size'),
//               children: [
//                 Container(
//                   height: 50,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: widget.productData['sizeList'].length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: OutlinedButton(
//                           onPressed: () {
//                             setState(() {
//                               _selectedSize =
//                                   widget.productData['sizeList'][index];
//                             });
//                           },
//                           child: Text(
//                             widget.productData['sizeList'][index],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       // Bottom Sheet
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
//           if (_selectedShippingDate == null) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text("Please choose a shipping date."),
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
//             widget.productData[' bussinessName'],
//             widget.productData['productSize'],
//             widget.productData['productPrice'] is int
//                 ? widget.productData['productPrice'].toDouble()
//                 : widget.productData['productPrice'],
//             1,
//             widget.productData['quantity'],
//             widget.productData['vendorId'],
//             _selectedSize! as Timestamp ,
//             _selectedShippingDate! as String,
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
                  // Text(
                  //   formatedDate(
                  //     widget.productData['scheduleDate'].toDate(),
                  //   ),
                  //   style: TextStyle(
                  //     color: Colors.blue,
                  //     fontSize: 15,
                  //     fontWeight: FontWeight.bold,
                  //     letterSpacing: 4,
                  //   ),
                  // )
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
      // bottomSheet: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Container(
      //     height: 50,
      //     width: MediaQuery.of(context).size.width,
      //     decoration: BoxDecoration(
      //       color: Colors.red.shade400,
      //       borderRadius: BorderRadius.circular(10),
      //     ),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.all(10.0),
      //           child: Icon(
      //             CupertinoIcons.cart,
      //             color: Colors.white10,
      //             size: 10,
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Text(
      //             'Add To Cart',
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 18,
      //                 letterSpacing: 3),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // )
      bottomSheet: GestureDetector(
        onTap: () {
          if (_selectedSize == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Please select a size before adding to cart."),
              ),
            );
            return;
          }

          // CartProvider.addProductToCart(
          //   widget.productData['productName'],
          //   widget.productData['productId'],
          //   widget.productData['imageUrl'],
          //   widget.productData['productPrice'],
          //   1,
          //   widget.productData['vendorId'],
          //   _selectedSize!,
          //   widget.productData['scheduleDate'],
          // );
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