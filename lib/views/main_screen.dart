// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:multi_vendor_app/views/buyers/navscreen.dart/accountscreen.dart';
// import 'package:multi_vendor_app/views/buyers/navscreen.dart/cartscreen.dart';
// import 'package:multi_vendor_app/views/buyers/navscreen.dart/categoryscreen.dart';
// import 'package:multi_vendor_app/views/buyers/navscreen.dart/homescreen.dart';
// import 'package:multi_vendor_app/views/buyers/navscreen.dart/searchscreen.dart';
// import 'package:multi_vendor_app/views/buyers/navscreen.dart/storescreen.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int pageIndex =0;

//   List<Widget> _pages =[
// Homescreen(),
// CategoryScreen(),
// StoreScreen(),
// CartScreen(),
// AccountScreen(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      bottomNavigationBar: BottomNavigationBar(
//       type: BottomNavigationBarType.fixed, //navigation bar page sangai change hunna
//       currentIndex: pageIndex,
//       onTap: (value) {
//         setState(() {
//           pageIndex = value;
//         }); //currentindex ma pageindex xa jun ma click garyo page ko value change hunxa tap garda
//       },
//     unselectedItemColor: Colors.black,
//     selectedItemColor:const Color.fromARGB(255, 30, 39, 97),
//     items: [
//       BottomNavigationBarItem(
//         icon: Icon(CupertinoIcons.home),
//         label:"Home"),
//             BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 'assets/icons/explore.svg',width:20),
//               label:"Categories"),
//                   BottomNavigationBarItem(
//                     icon: SvgPicture.asset(
//                 'assets/icons/store.svg',width:20),
//                     label:"Store"),
//                         BottomNavigationBarItem(
//                           icon: SvgPicture.asset(
//                 'assets/icons/cart.svg',width:20),
//                           label:"Cart"),
//                 //               BottomNavigationBarItem(
//                 //                 icon:SvgPicture.asset(
//                 // 'assets/icons/search.svg',width:20),
//                 //                 label:"Search"),
//                                  BottomNavigationBarItem(
//                                 icon: SvgPicture.asset(
//                 'assets/icons/account.svg',width:20),
//                                 label:"Account"),
                              
//      ],
//      ),
//      body:_pages[pageIndex],
//     );
//   }
//  }

// // import 'package:flutter/material.dart';
// // import 'package:multi_vendor_app/views/bottomNav_screens/cart_product_widget.dart';
// // import 'package:multi_vendor_app/views/bottomNav_screens/favourite_screen.dart';
// // import 'package:multi_vendor_app/views/bottomNav_screens/stores_screen.dart';
// // import 'package:multi_vendor_app/views/buyers/navscreen.dart/accountscreen.dart';
// // import 'package:multi_vendor_app/views/buyers/navscreen.dart/homescreen.dart';

// // class MainScreen extends StatefulWidget {
// //   const MainScreen({super.key});

// //   @override
// //   State<MainScreen> createState() => _MainScreenState();
// // }

// // class _MainScreenState extends State<MainScreen> {
// //   int pageIndex = 0;

// //   List<Widget> pages = [
// //     HomeScreen(),
// //     FavoriteScreen(),
// //     StoresScreen(),
// //     CartScreenProduct(),
// //     AccountScreen(),
// //   ];
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       bottomNavigationBar: BottomNavigationBar(
// //         onTap: (value) {
// //           setState(() {
// //             pageIndex = value;
// //           });
// //         },
// //         currentIndex: pageIndex,
// //         type: BottomNavigationBarType.fixed,
// //         selectedItemColor: Colors.purple,
// //         unselectedItemColor: Colors.grey,
// //         items: [
// //           BottomNavigationBarItem(
// //             backgroundColor: Colors.white.withOpacity(0.95),
// //             icon: Image.asset(
// //               'assets/icons/home.png',
// //               width: 25,
// //             ),
// //             label: 'Home',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Image.asset(
// //               'assets/icons/love.png',
// //               width: 25,
// //             ),
// //             label: 'Favorite',
// //           ),

// //            BottomNavigationBarItem(
// //             icon: Image.asset(
// //               'assets/icons/mart.png',
// //               width: 25,
// //             ),
// //             label: 'Stores',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Image.asset(
// //               'assets/icons/cart.png',
// //               width: 25,
// //             ),
// //             label: 'Cart',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Image.asset(
// //               'assets/icons/user.png',
// //               width: 25,
// //             ),
// //             label: 'Account',
// //           ),
// //         ],
// //       ),
// //       body: pages[pageIndex],
// //     );
// //   }
// // }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:multi_vendor_app/views/buyers/navscreen.dart/storescreen.dart'  a
import 'package:winkle_final/views/buyers/navscreen.dart/accountscreen.dart';
import 'package:winkle_final/views/buyers/navscreen.dart/cartscreen.dart';
import 'package:winkle_final/views/buyers/navscreen.dart/categoryscreen.dart';
import 'package:winkle_final/views/buyers/navscreen.dart/homescreen.dart';
import 'package:winkle_final/views/buyers/navscreen.dart/searchscreen.dart';
import 'package:winkle_final/views/buyers/navscreen.dart/storescreen.dart' as StoreScreen;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex =0;

  List<Widget> _pages =[
Homescreen(),
CategoryScreen(),
StoreScreen.StoreScreen(),
CartScreen(),
 SearchScreen(),
AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed, //navigation bar page sangai change hunna
      currentIndex: pageIndex,
      onTap: (value) {
        setState(() {
          pageIndex = value;
        }); //currentindex ma pageindex xa jun ma click garyo page ko value change hunxa tap garda
      },
    unselectedItemColor: Colors.black,
    selectedItemColor:const Color.fromARGB(255, 30, 39, 97),
    items: [
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        label:"Home"),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/explore.svg',width:20),
              label:"Categories"),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                'assets/icons/store.svg',width:20),
                    label:"Store"),
                        BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                'assets/icons/cart.svg',width:20),
                          label:"Cart"),
                              BottomNavigationBarItem(
                                icon:SvgPicture.asset(
                'assets/icons/search.svg',width:20),
                                label:"Search"),
                                 BottomNavigationBarItem(
                                icon: SvgPicture.asset(
                'assets/icons/account.svg',width:20),
                                label:"Account"),
                              
     ],
     ),
     body:_pages[pageIndex],
    );
  }
}