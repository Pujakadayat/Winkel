import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:winkle_final/Utilis/commonappbarview.dart';
import 'package:winkle_final/Utilis/commonbutton.dart';
import 'package:winkle_final/Utilis/themes.dart';
import 'package:winkle_final/models/favourite_model.dart';
import 'package:winkle_final/provider/favourite_provider.dart';



// class RangeSliderView extends StatefulWidget {
//   final Function(RangeValues) onChnageRangeValues;
//   final RangeValues values;

//   const RangeSliderView(
//       {Key? key, required this.values, required this.onChnageRangeValues})
//       : super(key: key);
//   @override
//   _RangeSliderViewState createState() => _RangeSliderViewState();
// }

// class _RangeSliderViewState extends State<RangeSliderView> {
//   late RangeValues _values;

//   @override
//   void initState() {
//     _values = widget.values;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: <Widget>[
//           Stack(
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   Expanded(
//                     flex: _values.start.round(),
//                     child: SizedBox(),
//                   ),
//                   Container(
//                     width: 54,
//                     child: Text(
//                       "\$${_values.start.round()}",
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1000 - _values.start.round(),
//                     child: SizedBox(),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: <Widget>[
//                   Expanded(
//                     flex: _values.end.round(),
//                     child: SizedBox(),
//                   ),
//                   Container(
//                     width: 54,
//                     child: Text(
//                       "\$${_values.end.round()}",
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1000 - _values.end.round(),
//                     child: SizedBox(),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           SliderTheme(
//             data: SliderThemeData(
//                 //   rangeThumbShape: CustomRangeThumbShape(),
//                 ),
//             child: RangeSlider(
//               values: _values,
//               min: 10.0,
//               max: 1000.0,
//               activeColor: Theme.of(context).primaryColor,
//               inactiveColor: Colors.grey.withOpacity(0.4),
//               divisions: 1000,
//               onChanged: (RangeValues values) {
//                 try {
//                   setState(() {
//                     _values = values;
//                   });
//                   widget.onChnageRangeValues(_values);
//                 } catch (e) {}
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SliderView extends StatefulWidget {
//   final Function(double) onChnagedistValue;
//   final double distValue;

//   const SliderView(
//       {Key? key, required this.onChnagedistValue, required this.distValue})
//       : super(key: key);
//   @override
//   _SliderViewState createState() => _SliderViewState();
// }

// class _SliderViewState extends State<SliderView> {
//   double distValue = 50.0;

//   @override
//   void initState() {
//     distValue = widget.distValue;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               Expanded(
//                 flex: distValue.round(),
//                 child: SizedBox(),
//               ),
//               Container(
//                 width: 170,
//                 child: Row(
//                   children: [
//                     Text(
//                    "Less_than",
//                       textAlign: TextAlign.center,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 4.0, right: 4.0),
//                       child: Text(
//                         "${(distValue / 10).toStringAsFixed(1)}",
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     Text(
//                      "km_text",
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 100 - distValue.round(),
//                 child: SizedBox(),
//               ),
//             ],
//           ),
//           Slider(
//             onChanged: (value) {
//               setState(() {
//                 distValue = value;
//               });
//               try {
//                 widget.onChnagedistValue(distValue);
//               } catch (e) {}
//             },
//             min: 0.0,
//             max: 100.0,
//             activeColor: Colors.blueGrey,
//             inactiveColor: Colors.black.withOpacity(0.4),
//             //   divisions: 100,
//             value: distValue,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FiltersScreen extends ConsumerStatefulWidget {
//   @override
//   _FiltersScreenState createState() => _FiltersScreenState();
// }

// class _FiltersScreenState extends ConsumerState<FiltersScreen> {
//   // List<PopularFilterListData> popularFilterListData =
//   //     PopularFilterListData.popularFList;
//   // List<PopularFilterListData> accomodationListData =
//   //     PopularFilterListData.accomodationList;

//   RangeValues _values = RangeValues(100, 600);
//   double distValue = 50.0;

//   @override
//   Widget build(BuildContext context) {
//     final favoriteItems = ref.watch(favoriteProvider);

//     return Container(
//       color: AppTheme.scaffoldBackgroundColor,
//       child: Scaffold(
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             CommonAppbarView(
//               iconData: Icons.close,
//               onBackClick: () {
//                 Navigator.pop(context);
//               },
//               titleText: "Filter",
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Column(
//                     children: <Widget>[
//                       // Hotel price filter
//                       priceBarFilter(),
//                       Divider(height: 1),
//                       // Popular filter
//                       popularFilter(),
//                       // Divider(height: 1),
//                       // // Hotel distance from city
//                       // distanceViewUI(),
//                       // Divider(height: 1),
//                       // // All type of accommodation
//                       // allAccommodationUI(),
//                       Divider(height: 1),
//                       // Favorite Products Section
//                       favoriteProductsSection(favoriteItems),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Divider(height: 1),
//             Padding(
//               padding: EdgeInsets.only(
//                 left: 16,
//                 right: 16,
//                 bottom: 16 + MediaQuery.of(context).padding.bottom,
//                 top: 8,
//               ),
//               child: CommonButton(
//                 buttonText: "Apply",
//                 onTap: () {
//                   Navigator.pop(context, true);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget favoriteProductsSection(Map<String, FavoriteModel> favoriteItems) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding:
//               const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
//           child: Text(
//             "Favorite Products",
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         if (favoriteItems.isEmpty)
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               "No favorite products yet.",
//               style: TextStyle(color: Colors.grey),
//             ),
//           )
//         else
//           Column(
//             children: favoriteItems.values.map((item) {
//               return Card(
//                 margin: const EdgeInsets.symmetric(vertical: 8),
//                 child: ListTile(
//                   leading: Image.network(
//                     item!.imageUrl.isNotEmpty ? item?.imageUrl[0] : '',
//                     width: 50,
//                     height: 50,
//                     fit: BoxFit.cover,
//                   ),
//                   title: Text(item!.productName),
//                   subtitle: Text("\$${item.price.toStringAsFixed(2)}"),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete, color: Colors.red),
//                     onPressed: () {
//                       ref.read(favoriteProvider.notifier).removeItem(item!.productId);
//                     },
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//       ],
//     );
//   }

//   Widget priceBarFilter() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Text(
//             "Price Range",
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
//               fontWeight: FontWeight.normal,
//             ),
//           ),
//         ),
//         RangeSlider(
//           values: _values,
//           min: 0,
//           max: 1000,
//           divisions: 10,
//           onChanged: (values) {
//             setState(() {
//               _values = values;
//             });
//           },
//         ),
//         SizedBox(height: 8),
//       ],
//     );
//   }
//   Widget popularFilter() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//           padding:
//               const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
//           child: Text(
//             "Popular Filters",
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
//               fontWeight: FontWeight.normal,
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 16, right: 16),
//           child: Wrap(
//             spacing: 10,
//             runSpacing: 10,
//             children: popularFilterListData
//                 .map(
//                   (filter) => FilterChip(
//                     label: Text(filter.titleTxt),
//                     selected: filter.isSelected,
//                     onSelected: (selected) {
//                       setState(() {
//                         filter.isSelected = selected;
//                       });
//                     },
//                   ),
//                 )
//                 .toList(),
//           ),
//         ),
//         SizedBox(height: 8),
//       ],
//     );
//   }

// }
class FiltersScreen extends ConsumerStatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  RangeValues _values = RangeValues(100, 600);
  double distValue = 50.0;

  // Sample cart data (this could be fetched from the provider or database)
  Map<String, int> cartProductCount = {}; // Track cart additions per product

  @override
  Widget build(BuildContext context) {
    final favoriteItems = ref.watch(favoriteProvider);

    // Filter the popular products that have been added max 3 times to the cart
    List<Product> popularProducts = _getPopularProducts();

    return Container(
      color: AppTheme.scaffoldBackgroundColor,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonAppbarView(
              iconData: Icons.close,
              onBackClick: () {
                Navigator.pop(context);
              },
              titleText: "Filter",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: <Widget>[
                      // Hotel price filter
                      priceBarFilter(),
                      Divider(height: 1),
                      // Popular filter
                      popularFilter(popularProducts),
                      Divider(height: 1),
                      // Favorite Products Section
                      favoriteProductsSection(favoriteItems),
                    ],
                  ),
                ),
              ),
            ),
            Divider(height: 1),
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16 + MediaQuery.of(context).padding.bottom,
                top: 8,
              ),
              child: CommonButton(
                buttonText: "Apply",
                onTap: () {
                  Navigator.pop(context, true);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to get popular products (added max 3 times to cart)
  List<Product> _getPopularProducts() {
    // Mock data: Normally this would come from your database or provider
    List<Product> allProducts = getAllProducts(); // Fetch all products

    // Filter products that have been added 3 times or less
    List<Product> popularProducts = allProducts.where((product) {
      int count = cartProductCount[product.id] ?? 0;
      return count <= 3;
    }).toList();

    return popularProducts;
  }

  Widget popularFilter(List<Product> popularProducts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            "Popular Products (Added Max 3 Times)",
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: popularProducts
                .map(
                  (product) => FilterChip(
                    label: Text(product.name),
                    selected: false,
                    onSelected: (selected) {
                      // Handle selection of popular products
                    },
                  ),
                )
                .toList(),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }

  // Function to display favorite products (similar to original code)
  Widget favoriteProductsSection(Map<String, FavoriteModel> favoriteItems) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
          child: Text(
            "Favorite Products",
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (favoriteItems.isEmpty)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "No favorite products yet.",
              style: TextStyle(color: Colors.grey),
            ),
          )
        else
          Column(
            children: favoriteItems.values.map((item) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: Image.network(
                    item!.imageUrl.isNotEmpty ? item?.imageUrl[0] : '',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item!.productName),
                  subtitle: Text("\$${item.price.toStringAsFixed(2)}"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      ref.read(favoriteProvider.notifier).removeItem(item!.productId);
                    },
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }

  Widget priceBarFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Price Range",
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        RangeSlider(
          values: _values,
          min: 0,
          max: 1000,
          divisions: 10,
          onChanged: (values) {
            setState(() {
              _values = values;
            });
          },
        ),
        SizedBox(height: 8),
      ],
    );
  }

  // This is a placeholder function to represent fetching all products
  List<Product> getAllProducts() {
    return [
      Product(id: "1", name: "Product 1"),
      Product(id: "2", name: "Product 2"),
      Product(id: "3", name: "Product 3"),
      // Add more products as needed
    ];
  }
}

// Example Product class
class Product {
  final String id;
  final String name;

  Product({required this.id, required this.name});
}
