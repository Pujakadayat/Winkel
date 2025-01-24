import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:winkle_final/vendor/controller/vendor_login_screen.dart';
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
 Future<void> _showLogoutConfirmation() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                setState(() {
                  _pageIndex = 0; // Reset to first page
                });
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                // Perform logout operation here
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VendorLoginScreen(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          onTap: 
          ((value) {
             if (value == 4) { // Index 4 is logout
            _showLogoutConfirmation();
          } else {
            setState(() {
              _pageIndex = value;
            });
          }
       
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
              icon: FaIcon(FontAwesomeIcons.arrowUp),
              label: 'UPLOAD',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.times),
              label: 'Edit',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.shopping_cart),
              label: 'ORDERS',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.signOutAlt),
              label: 'LOGOUT',
            ),
          ]),
      body: _pages[_pageIndex],
    );
  }
}
