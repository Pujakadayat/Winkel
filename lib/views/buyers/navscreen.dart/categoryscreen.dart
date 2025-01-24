import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:winkle_final/views/buyers/inner_screens/all_products_screen.dart';
import 'package:winkle_final/views/buyers/navscreen.dart/widgets/home_products.dart';
import 'package:winkle_final/views/buyers/navscreen.dart/widgets/main_products_widget.dart';


class CategoryScreen extends StatefulWidget {
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _categoryStream =
        FirebaseFirestore.instance.collection('categories').snapshots();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        backgroundColor: const Color.fromARGB(255, 116, 86, 54),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Categories Grid
              StreamBuilder<QuerySnapshot>(
                stream: _categoryStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Loading categories"),
                    );
                  }

                  // Get categories data
                  final categoryData = snapshot.data!.docs;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of categories in a row
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: categoryData.length,
                    itemBuilder: (context, index) {
                      final category = categoryData[index];
                      return GestureDetector(
                        // onTap: () {
                        //   setState(
                        //     () {
                        //       _selectedCategory = category['categoryName'];
                        //     },
                        //   );
                        //   AllProductScreen(
                        //     categoryData: _selectedCategory,
                        //   );
                        //   print(_selectedCategory);
                        // },
                        onTap: () {
                          // Navigate to AllProductScreen with the selected category
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllProductScreen(
                                categoryName: category['categoryName'],
                              ),
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Color.fromARGB(255, 197, 164, 122),
                          child: Center(
                            child: Text(
                              category['categoryName'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),

              // Show products based on selected category
              if (_selectedCategory == null) MainProductsWidget(),
              if (_selectedCategory != null)
                HomeproductWidget(categoryName: _selectedCategory!),
            ],
          ),
        ),
      ),
    );
  }
}