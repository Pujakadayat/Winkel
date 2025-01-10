import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:winkle_final/vendor/vendor_screens/earnings_screen.dart';
import 'package:winkle_final/vendor/vendor_screens/edit_product_screen.dart';
import 'package:winkle_final/vendor/vendor_screens/upload_screen.dart';
import 'package:winkle_final/vendor/vendor_screens/vendor_logoutscreen.dart';
import 'package:winkle_final/vendor/vendor_screens/vendor_orderscreen.dart';
class MainVendorScreen extends StatefulWidget {
  const MainVendorScreen({super.key});

  @override
  State<MainVendorScreen> createState() => _MainVendorScreenState();
}

class _MainVendorScreenState extends State<MainVendorScreen> {
  int _pageIndex = 0;

  List<Widget> _pages = [
    EarningsScreen(),
    UploadScreen(),
    EditProductScreen(),
    VendorOrderScreen(),
    VendorLogoutscreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          onTap: ((value) {
            setState(() {
              _pageIndex = value;
            });
          }),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.redAccent,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.money_dollar),
              label: 'Earnings',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.arrowUp), // Updated cross icon
              label: 'UPLOAD',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.times), // Updated cross icon
              label: 'Edit',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.shopping_cart),
              label: 'ORDERS',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.signOutAlt), // Updated cross icon
              label: 'LOGOUT',
            ),
          ]),
      body: _pages[_pageIndex],
    );
  }
}
