import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:winkle_final/models/cart_attributes.dart'; // Ensure this import is present for ChangeNotifier

class CartProvider with ChangeNotifier {
  final Map<String, CartAttr> _cartItems = {}; // This is your cart items map
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
  double _totalPrice = 0;
  // Map<String, CartAttr> get getCartItem => _cartItems;
    Map<String, CartAttr> get getCartItem {
    return _cartItems;
  }
 double get totalPrice {
    var total = 0.00;

    _cartItems.forEach((key, value) {
      total += value.price * value.quantity;
    });

    return total;
  }
  

void clearSelectedItems() {
  _cartItems.removeWhere((key, cartItem) => cartItem.isSelected);
  notifyListeners();
}
  // Select product for checkout
  void selectProduct(String productId) {
    if (_cartItems.containsKey(productId)) {
      final existingCartItem = _cartItems[productId];
      _cartItems.update(
        productId,
        (existingCartItem) => CartAttr(
          bussinessName: existingCartItem.bussinessName,
          productName: existingCartItem.productName,
          productId: existingCartItem.productId,
          imageUrl: existingCartItem.imageUrl,
          quantity: existingCartItem.quantity,
          productQuantity: existingCartItem.productQuantity,
          price: existingCartItem.price,
          vendorId: existingCartItem.vendorId,
          productSize: existingCartItem.productSize,
          scheduleDate: existingCartItem.scheduleDate,
          // fullName: existingCartItem.fullName,
          // email: existingCartItem.email,
          // buyerPhoto: existingCartItem.buyerPhoto,
          isSelected: true,  // Mark as selected
        ),
      );
      notifyListeners();
    }
  }

  // Deselect product for checkout
  void deselectProduct(String productId) {
    if (_cartItems.containsKey(productId)) {
      final existingCartItem = _cartItems[productId];
      _cartItems.update(
        productId,
        (existingCartItem) => CartAttr(
          bussinessName: existingCartItem.bussinessName,
          productName: existingCartItem.productName,
          productId: existingCartItem.productId,
          imageUrl: existingCartItem.imageUrl,
          quantity: existingCartItem.quantity,
          productQuantity: existingCartItem.productQuantity,
          price: existingCartItem.price,
          vendorId: existingCartItem.vendorId,
          productSize: existingCartItem.productSize,
          scheduleDate: existingCartItem.scheduleDate,
          //  fullName: existingCartItem.fullName,
          //  email: existingCartItem.email,
          //  buyerPhoto: existingCartItem.buyerPhoto,
          isSelected: false,  // Mark as deselected
        ),
      );
      notifyListeners();
    }
  }


  void addProductToCart(
    String productName,
    String productId,
    List imageUrl,
    double price,
    int quantity,
    int productQuantity,
    String vendorId,
    String productSize,
    Timestamp scheduleDate,
  ) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (existingCartItem) => CartAttr(
          bussinessName: existingCartItem.bussinessName,
          productName: existingCartItem.productName,
          productId: existingCartItem.productId,
          imageUrl: existingCartItem.imageUrl,
          quantity: existingCartItem.quantity + 1,
          productQuantity: existingCartItem.productQuantity,
          price: existingCartItem.price,
          vendorId: existingCartItem.vendorId,
          productSize: existingCartItem.productSize,
          scheduleDate: existingCartItem.scheduleDate,
        ),
      );
    } else {
      _cartItems[productId] = CartAttr(
        productName: productName,
        productId: productId,
        imageUrl: imageUrl,
        quantity: quantity,
        productQuantity: productQuantity,
        price: price,
        vendorId: vendorId,
        productSize: productSize,
        scheduleDate: scheduleDate,
        bussinessName: '',
      );
    }
   // Save cart after modification
    notifyListeners();
  }

double get selectedItemsTotalPrice {
  double total = 0.0;
  _cartItems.forEach((key, cartItem) {
    if (cartItem.isSelected) {
      total += cartItem.price * cartItem.quantity;
    }
  });
  print('Selected Items Total Price: $total');
  return total;
}

  get bussinessName => null;


  void increment(String productId) {
    if (_cartItems.containsKey(productId)) {
      final existingCartItem = _cartItems[productId];
      if (existingCartItem != null &&
          existingCartItem.quantity < existingCartItem.productQuantity) {
        _cartItems.update(
          productId,
          (existingCartItem) => CartAttr(
            bussinessName: existingCartItem.bussinessName,
            productName: existingCartItem.productName,
            productId: existingCartItem.productId,
            imageUrl: existingCartItem.imageUrl,
            quantity: existingCartItem.quantity + 1,
            productQuantity: existingCartItem.productQuantity,
            price: existingCartItem.price,
            vendorId: existingCartItem.vendorId,
            productSize: existingCartItem.productSize,
            scheduleDate: existingCartItem.scheduleDate,
          //    fullName: existingCartItem.fullName,
          //  email: existingCartItem.email,
          //  buyerPhoto: existingCartItem.buyerPhoto,
          ),
        );
        notifyListeners();
      }
    }
  }

  void decrement(String productId) {
    if (_cartItems.containsKey(productId)) {
      final existingCartItem = _cartItems[productId];
      if (existingCartItem != null && existingCartItem.quantity > 1) {
        _cartItems.update(
          productId,
          (existingCartItem) => CartAttr(
            bussinessName: existingCartItem.bussinessName,
            productName: existingCartItem.productName,
            productId: existingCartItem.productId,
            imageUrl: existingCartItem.imageUrl,
            quantity: existingCartItem.quantity - 1,
            productQuantity: existingCartItem.productQuantity,
            price: existingCartItem.price,
            vendorId: existingCartItem.vendorId,
            productSize: existingCartItem.productSize,
            scheduleDate: existingCartItem.scheduleDate,
            // fullName: existingCartItem.fullName,
            // email: existingCartItem.email,
            // buyerPhoto: existingCartItem.buyerPhoto,
          ),
        );
        notifyListeners();
      }
    }
  }

  void removeItem(String productId) {
    _cartItems.remove(productId);
     notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

}

