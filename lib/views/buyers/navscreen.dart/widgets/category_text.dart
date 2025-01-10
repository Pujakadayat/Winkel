// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:flutter/cupertino.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:multi_vendor_app/views/buyers/navscreen.dart/widgets/home_products.dart';

// // // class CategoryText extends StatefulWidget {
// // //   @override
// // //   State<CategoryText> createState() => _CategoryTextState();
// // // }

// // // class _CategoryTextState extends State<CategoryText> {
// // // String? _selectedCategory ;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final Stream<QuerySnapshot> _categoryStream = FirebaseFirestore.instance.collection('categories').snapshots();
// // //     return Padding(
// // //       padding: const EdgeInsets.all(9.0),
     
// // //       child: Column(
// // //          crossAxisAlignment:CrossAxisAlignment.start,
// // //         children: [
// // //           Text(
// // //             "Categories ",
// // //             style: TextStyle(
// // //               fontSize: 19
// // //               ),
// // //               ),

// // //               StreamBuilder<QuerySnapshot>(
// // //       stream: _categoryStream,
// // //       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// // //         if (snapshot.hasError) {
// // //           return Text('Something went wrong');
// // //         }

// // //         if (snapshot.connectionState == ConnectionState.waiting) {
// // //           return Padding(
// // //             padding: const EdgeInsets.all(8.0),
// // //             child: Text("Loading categories"),
// // //           );
// // //         }

// // //         return 
// // //               Container(
// // //                 height:40,
// // //                 child: Row(children: [
// // // Expanded(
// // //   child: ListView.builder(
// // //     scrollDirection: Axis.horizontal,
// // //   itemCount: snapshot.data!.docs.length,
// // //     itemBuilder: (context,index){
// // //       final categoryData = snapshot.data!.docs[index];
// // // return Padding(
// // //   padding: const EdgeInsets.all(8.0),
// // //   child: ActionChip(
// // //     backgroundColor: Color.fromARGB(255, 64, 142, 198),

// // //     onPressed: () {
// // //       setState(() {
// // //         _selectedCategory = categoryData['categoryName'];
// // //       });
// // //       print(_selectedCategory);
// // //     },
// // //     label: Center(child: Text(
// // //    categoryData['categoryName'],
// // //       style: TextStyle(
// // //       color:Colors.white,
// // //       fontSize: 12,
// // //       fontWeight: FontWeight.bold,
// // //       ),
// // //       )
// // //       )
// // //       ),
// // // );
// // // },
// // // ),
// // // ),
// // // IconButton(onPressed: () {},
// // //  icon:Icon(Icons.arrow_forward_ios),
// // //  ),
// // //                 ],
// // //                 ),
// // //               );
// // //       },
// // //     ),
   
// // // if(_selectedCategory!=null)
// // // HomeproductWidget(categoryName: _selectedCategory!
// // // ),

// // //         ],
// // //       ),
// // //     );
// // //   }
  
// // //   HomeproductWidget({required String categoryName}) {}
// // // }


// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:flutter/cupertino.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:multi_vendor_app/views/buyers/navscreen.dart/widgets/main_products_widget.dart';
// // // import 'home_products.dart'; // Ensure the import path is correct

// // // class CategoryText extends StatefulWidget {
// // //   @override
// // //   State<CategoryText> createState() => _CategoryTextState();
// // // }

// // // class _CategoryTextState extends State<CategoryText> {
// // //   String? _selectedCategory;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final Stream<QuerySnapshot> _categoryStream =
// // //         FirebaseFirestore.instance.collection('categories').snapshots();

// // //     return Padding(
// // //       padding: const EdgeInsets.all(9.0),
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           Text(
// // //             "Categories",
// // //             style: TextStyle(fontSize: 19),
// // //           ),
// // //           StreamBuilder<QuerySnapshot>(
// // //             stream: _categoryStream,
// // //             builder:
// // //                 (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// // //               if (snapshot.hasError) {
// // //                 return Text('Something went wrong');
// // //               }

// // //               if (snapshot.connectionState == ConnectionState.waiting) {
// // //                 return Padding(
// // //                   padding: const EdgeInsets.all(8.0),
// // //                   child: Text("Loading categories"),
// // //                 );
// // //               }

// // //               return Container(
// // //                 height: 40,
// // //                 child: Row(
// // //                   children: [
// // //                     Expanded(
// // //                       child: ListView.builder(
// // //                         scrollDirection: Axis.horizontal,
// // //                         itemCount: snapshot.data!.docs.length,
// // //                         itemBuilder: (context, index) {
// // //                           final categoryData = snapshot.data!.docs[index];
// // //                           return Padding(
// // //                             padding: const EdgeInsets.all(8.0),
// // //                             child: ActionChip(
// // //                               backgroundColor:
// // //                                   Color.fromARGB(255, 64, 142, 198),
// // //                               onPressed: () {
// // //                                 setState(() {
// // //                                   _selectedCategory =
// // //                                       categoryData['categoryName'];
// // //                                 });
// // //                                 print(_selectedCategory);
// // //                               },
// // //                               label: Center(
// // //                                 child: Text(
// // //                                   categoryData['categoryName'],
// // //                                   style: TextStyle(
// // //                                     color: Colors.white,
// // //                                     fontSize: 12,
// // //                                     fontWeight: FontWeight.bold,
// // //                                   ),
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           );
// // //                         },
// // //                       ),
// // //                     ),
// // //                     IconButton(
// // //                       onPressed: () {},
// // //                       icon: Icon(Icons.arrow_forward_ios),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               );
// // //             },
// // //           ),
// // //           if (_selectedCategory == null) MainProductsWidget(),
// // //           if (_selectedCategory != null)
// // //             HomeproductWidget(categoryName: _selectedCategory!),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }


// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:multi_vendor_app/views/buyers/navscreen.dart/widgets/main_products_widget.dart';
// // import 'home_products.dart'; // Ensure the import path is correct

// // class CategoryText extends StatefulWidget {
// //   @override
// //   State<CategoryText> createState() => _CategoryTextState();
// // }

// // class _CategoryTextState extends State<CategoryText> {
// //   String? _selectedCategory;

// //   @override
// //   Widget build(BuildContext context) {
// //     final Stream<QuerySnapshot> _categoryStream =
// //         FirebaseFirestore.instance.collection('categories').snapshots();

// //     return Padding(
// //       padding: const EdgeInsets.all(9.0),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             "Categories",
// //             style: TextStyle(fontSize: 19),
// //           ),
// //           StreamBuilder<QuerySnapshot>(
// //             stream: _categoryStream,
// //             builder:
// //                 (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// //               if (snapshot.hasError) {
// //                 return Text('Something went wrong');
// //               }

// //               if (snapshot.connectionState == ConnectionState.waiting) {
// //                 return Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Text("Loading categories"),
// //                 );
// //               }

// //               return Container(
// //                 height: 40,
// //                 child: Row(
// //                   children: [
// //                     Expanded(
// //                       child: ListView.builder(
// //                         scrollDirection: Axis.horizontal,
// //                         itemCount: snapshot.data!.docs.length,
// //                         itemBuilder: (context, index) {
// //                           final categoryData = snapshot.data!.docs[index];
// //                           return Padding(
// //                             padding: const EdgeInsets.all(8.0),
// //                             child: ActionChip(
// //                               backgroundColor:
// //                                   Color.fromARGB(255, 64, 142, 198),
// //                               onPressed: () {
// //                                 setState(() {
// //                                   _selectedCategory =
// //                                       categoryData['categoryName'];
// //                                 });
// //                                 print(_selectedCategory);
// //                               },
// //                               label: Center(
// //                                 child: Text(
// //                                   categoryData['categoryName'],
// //                                   style: TextStyle(
// //                                     color: Colors.white,
// //                                     fontSize: 12,
// //                                     fontWeight: FontWeight.bold,
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                           );
// //                         },
// //                       ),
// //                     ),
// //                     IconButton(
// //                       onPressed: () {},
// //                       icon: Icon(Icons.arrow_forward_ios),
// //                     ),
// //                   ],
// //                 ),
// //               );
// //             },
// //           ),
// //           if (_selectedCategory == null) MainProductsWidget(),
// //           if (_selectedCategory != null)
// //             HomeproductWidget(categoryName: _selectedCategory!),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';



// class CategoryWidget extends StatelessWidget {
//   const CategoryWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 83,
//       height: 99,
//       clipBehavior: Clip.antiAlias,
//       decoration: const BoxDecoration(),
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           const Positioned(
//             left: 0,
//             top: 69,
//             child: SizedBox(
//               width: 83,
//               height: 30,
//               child: Text(
//                 'Fashion',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                   letterSpacing: 0.3,
//                   fontFamily: 'Lato',
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             left: 10,
//             top: 0,
//             child: Material(
//               type: MaterialType.transparency,
//               borderRadius: BorderRadius.circular(12),
//               clipBehavior: Clip.antiAlias,
//               child: InkWell(
//                 onTap: () {},
//                 overlayColor: const MaterialStatePropertyAll<Color>(
//                   Color(0x0c7f7f7f),
//                 ),
//                 child: Ink(
//                   color: Colors.white,
//                   width: 63,
//                   height: 63,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             left: 18,
//             top: 5,
//             child: Image.network(
//               'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2FoWHqAkkBQtCIoAn9Tb3B%2Fd84d713c22858e1d6a3fa0fb820a13dcfabf3230clothes.png?alt=media&token=8b5edcd3-b686-47e9-b5ec-06d60f92d8d3',
//               width: 47,
//               height: 47,
//               fit: BoxFit.cover,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:winkle_final/views/buyers/navscreen.dart/widgets/home_products.dart';
import 'package:winkle_final/views/buyers/navscreen.dart/widgets/main_products_widget.dart';

// class CategoryText extends StatefulWidget {
//   @override
//   State<CategoryText> createState() => _CategoryTextState();
// }

// class _CategoryTextState extends State<CategoryText> {
//   String? _selectedCategory;

//   @override
//   Widget build(BuildContext context) {
//     final Stream<QuerySnapshot> _catgoryStream =
//         FirebaseFirestore.instance.collection('categories').snapshots();
//     return Padding(
//       padding: const EdgeInsets.all(9.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Categories',
//             style: TextStyle(
//               fontSize: 19,
//             ),
//           ),
//           StreamBuilder<QuerySnapshot>(
//             stream: _catgoryStream,
//             builder:
//                 (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.hasError) {
//                 return Text('Something went wrong');
//               }

//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text("Loading categories"),
//                 );
//               }

//               return Container(
//                 height: 40,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: snapshot.data!.docs.length,
//                         itemBuilder: (context, index) {
//                           final categoryData = snapshot.data!.docs[index];
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: ActionChip(
//                                 backgroundColor: Colors.yellow.shade900,
//                                 onPressed: () {
//                                   setState(() {
//                                     _selectedCategory =
//                                         categoryData['categoryName'];
//                                   });

//                                   print(_selectedCategory);
//                                 },
//                                 label: Center(
//                                   child: Text(
//                                     categoryData['categoryName'],
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 )),
//                           );
//                         },
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) {
//                           return CategoryScreen();
//                         }));
//                       },
//                       icon: Icon(Icons.arrow_forward_ios),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//           if (_selectedCategory == null) MainProductsWidget(),
//           if (_selectedCategory != null)
//             HomeproductWidget(categoryName: _selectedCategory!),
//         ],
//       ),
//     );
//   }
// }


// class CategoryText extends StatefulWidget {
//   @override
//   State<CategoryText> createState() => _CategoryTextState();
// }

// class _CategoryTextState extends State<CategoryText> {
//   String? _selectedCategory;

//   @override
//   Widget build(BuildContext context) {
//     final Stream<QuerySnapshot> _categoryStream =
//         FirebaseFirestore.instance.collection('categories').snapshots();

//     return Padding(
//       padding: const EdgeInsets.all(9.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Categories",
//             style: TextStyle(fontSize: 19),
//           ),
//           StreamBuilder<QuerySnapshot>(
//             stream: _categoryStream,
//             builder:
//                 (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.hasError) {
//                 return Text('Something went wrong');
//               }

//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text("Loading categories"),
//                 );
//               }

//               return Container(
//                 height: 40,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: snapshot.data!.docs.length,
//                         itemBuilder: (context, index) {
//                           final categoryData = snapshot.data!.docs[index];
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: ActionChip(
//                               backgroundColor:
//                                   Color.fromARGB(255, 64, 142, 198),
//                               onPressed: () {
//                                 setState(() {
//                                   _selectedCategory =
//                                       categoryData['categoryName'];
//                                 });
//                                 print(_selectedCategory);
//                               },
//                               label: Center(
//                                 child: Text(
//                                   categoryData['categoryName'],
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(Icons.arrow_forward_ios),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//           if (_selectedCategory == null) MainProductsWidget(),
//           if (_selectedCategory != null)
//             HomeproductWidget(categoryName: _selectedCategory!),
//         ],
//       ),
//     );
//   }
// }


class CategoryText extends StatefulWidget {
  @override
  State<CategoryText> createState() => _CategoryTextState();
}

class _CategoryTextState extends State<CategoryText> {
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _categoryStream =
        FirebaseFirestore.instance.collection('categories').snapshots();

    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Categories",
            style: TextStyle(fontSize: 19),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: _categoryStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Loading categories"),
                );
              }

              return Container(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final categoryData = snapshot.data!.docs[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ActionChip(
                              backgroundColor:
                                  Color.fromARGB(255, 64, 142, 198),
                              onPressed: () {
                                setState(() {
                                  _selectedCategory =
                                      categoryData['categoryName'];
                                });
                                print(_selectedCategory);
                              },
                              label: Center(
                                child: Text(
                                  categoryData['categoryName'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              );
            },
          ),
          if (_selectedCategory == null) MainProductsWidget(),
          if (_selectedCategory != null)
            HomeproductWidget(categoryName: _selectedCategory!),
        ],
      ),
    );
  }
}