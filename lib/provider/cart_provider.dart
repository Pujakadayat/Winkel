
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';



// class CartProvider with ChangeNotifier {
//   Map<String, CartAttr> _cartItems = {};

//   Map<String, CartAttr> get getCartItem {
//     return _cartItems;
//   }

//   double get totalPrice {
//     var total = 0.00;

//     _cartItems.forEach((key, value) {
//       total += value.price * value.quantity;
//     });

//     return total;
//   }

//   void addProductToCart(
//       String productName,
//       String productId,
//       List imageUrl,
//       int quantity,
//       int productQuantity,
//       double price,
//       String vendorId,
//       String productSize,
//       Timestamp scheduleDate) {
//     if (_cartItems.containsKey(productId)) {
//       _cartItems.update(
//           productId,
//           (exitingCart) => CartAttr(
//               productName: exitingCart.productName,
//               productId: exitingCart.productId,
//               imageUrl: exitingCart.imageUrl,
//               quantity: exitingCart.quantity + 1,
//               productQuantity: exitingCart.productQuantity,
//               price: exitingCart.price,
//               vendorId: exitingCart.vendorId,
//               productSize: exitingCart.productSize,
//               scheduleDate: exitingCart.scheduleDate));

//       notifyListeners();
//     } else {
//       _cartItems.putIfAbsent(
//           productId,
//           () => CartAttr(
//               productName: productName,
//               productId: productId,
//               imageUrl: imageUrl,
//               quantity: quantity,
//               productQuantity: productQuantity,
//               price: price,
//               vendorId: vendorId,
//               productSize: productSize,
//               scheduleDate: scheduleDate));

//       notifyListeners();
//     }
//   }

//   void increament(CartAttr cartAttr) {
//     cartAttr.increase();

//     notifyListeners();
//   }

//   void decreaMent(CartAttr cartAttr) {
//     cartAttr.decrease();

//     notifyListeners();
//   }

//   removeItem(productId) {
//     _cartItems.remove(productId);

//     notifyListeners();
//   }

//   removeAllItem() {
//     _cartItems.clear();

//     notifyListeners();
//   }
// // }
// class CartProvider with ChangeNotifier {
//   final Map<String, CartAttr> _cartItems = {};

//   Map<String, CartAttr> get cartItems => _cartItems;

//   double get totalPrice {
//     double total = 0.0;
//     _cartItems.forEach((key, value) {
//       total += value.price * value.quantity;
//     });
//     return total;
//   }

//   get getCartItem => null;

//   void addProductToCart(
//     String productName,
//     String productId,
//     List imageUrl,
//     int quantity,
//     int productQuantity,
//     double price,
//     String vendorId,
//     String productSize,
//     Timestamp scheduleDate,
//   ) {
//     if (_cartItems.containsKey(productId)) {
//       _cartItems.update(
//         productId,
//         (existingCartItem) => CartAttr(
//           productName: existingCartItem.productName,
//           productId: existingCartItem.productId,
//           imageUrl: existingCartItem.imageUrl,
//           quantity: existingCartItem.quantity + 1,
//           productQuantity: existingCartItem.productQuantity,
//           price: existingCartItem.price,
//           vendorId: existingCartItem.vendorId,
//           productSize: existingCartItem.productSize,
//           scheduleDate: existingCartItem.scheduleDate,
//         ),
//       );
//     } else {
//       _cartItems[productId] = CartAttr(
//         productName: productName,
//         productId: productId,
//         imageUrl: imageUrl,
//         quantity: quantity,
//         productQuantity: productQuantity,
//         price: price,
//         vendorId: vendorId,
//         productSize: productSize,
//         scheduleDate: scheduleDate,
//       );
//     }
//     notifyListeners();
//   }

//   void increment(String productId) {
//     if (_cartItems.containsKey(productId)) {
//       _cartItems.update(
//         productId,
//         (existingCartItem) => CartAttr(
//           productName: existingCartItem.productName,
//           productId: existingCartItem.productId,
//           imageUrl: existingCartItem.imageUrl,
//           quantity: existingCartItem.quantity + 1,
//           productQuantity: existingCartItem.productQuantity,
//           price: existingCartItem.price,
//           vendorId: existingCartItem.vendorId,
//           productSize: existingCartItem.productSize,
//           scheduleDate: existingCartItem.scheduleDate,
//         ),
//       );
//       notifyListeners();
//     }
//   }

//   void decrement(String productId) {
//     if (_cartItems.containsKey(productId)) {
//       final currentQuantity = _cartItems[productId]!.quantity;
//       if (currentQuantity > 1) {
//         _cartItems.update(
//           productId,
//           (existingCartItem) => CartAttr(
//             productName: existingCartItem.productName,
//             productId: existingCartItem.productId,
//             imageUrl: existingCartItem.imageUrl,
//             quantity: currentQuantity - 1,
//             productQuantity: existingCartItem.productQuantity,
//             price: existingCartItem.price,
//             vendorId: existingCartItem.vendorId,
//             productSize: existingCartItem.productSize,
//             scheduleDate: existingCartItem.scheduleDate,
//           ),
//         );
//         notifyListeners();
//       }
//     }
//   }

//   void removeItem(String productId) {
//     _cartItems.remove(productId);
//     notifyListeners();
//   }

//   void clearCart() {
//     _cartItems.clear();
//     notifyListeners();
//   }

//   void removeAllItem() {}
// // }
// class CartProvider with ChangeNotifier {
//   final Map<String, CartAttr> _cartItems = {};

//   Map<String, CartAttr> get cartItems => _cartItems;

//   double get totalPrice {
//     double total = 0.0;
//     _cartItems.forEach((key, value) {
//       total += value.price * value.quantity;
//     });
//     return total;
//   }

//   // Add product to cart
//   void addProductToCart(
//     String productName,
//     String productId,
//     List imageUrl,
//     double price,
//     int quantity,
//     int productQuantity,
//     String vendorId,
//     String productSize,
//     Timestamp scheduleDate,
//   ) {
//     if (_cartItems.containsKey(productId)) {
//       _cartItems.update(
//         productId,
//         (existingCartItem) => CartAttr(
//           productName: existingCartItem.productName,
//           productId: existingCartItem.productId,
//           imageUrl: existingCartItem.imageUrl,
//           quantity: existingCartItem.quantity + 1,
//           productQuantity: existingCartItem.productQuantity,
//           price: existingCartItem.price,
//           vendorId: existingCartItem.vendorId,
//           productSize: existingCartItem.productSize,
//           scheduleDate: existingCartItem.scheduleDate,
//         ),
//       );
//     } else {
//       _cartItems[productId] = CartAttr(
//         productName: productName,
//         productId: productId,
//         imageUrl: imageUrl,
//         quantity: quantity,
//         productQuantity: productQuantity,
//         price: price,
//         vendorId: vendorId,
//         productSize: productSize,
//         scheduleDate: scheduleDate,
//       );
//     }
//     notifyListeners();
//   }

//   void increment(String productId) {
//     if (_cartItems.containsKey(productId)) {
//       _cartItems.update(
//         productId,
//         (existingCartItem) => CartAttr(
//           productName: existingCartItem.productName,
//           productId: existingCartItem.productId,
//           imageUrl: existingCartItem.imageUrl,
//           quantity: existingCartItem.quantity + 1,
//           productQuantity: existingCartItem.productQuantity,
//           price: existingCartItem.price,
//           vendorId: existingCartItem.vendorId,
//           productSize: existingCartItem.productSize,
//           scheduleDate: existingCartItem.scheduleDate,
//         ),
//       );
//       notifyListeners();
//     }
//   }

//   void decrement(String productId) {
//     if (_cartItems.containsKey(productId)) {
//       final currentQuantity = _cartItems[productId]!.quantity;
//       if (currentQuantity > 1) {
//         _cartItems.update(
//           productId,
//           (existingCartItem) => CartAttr(
//             productName: existingCartItem.productName,
//             productId: existingCartItem.productId,
//             imageUrl: existingCartItem.imageUrl,
//             quantity: currentQuantity - 1,
//             productQuantity: existingCartItem.productQuantity,
//             price: existingCartItem.price,
//             vendorId: existingCartItem.vendorId,
//             productSize: existingCartItem.productSize,
//             scheduleDate: existingCartItem.scheduleDate,
//           ),
//         );
//         notifyListeners();
//       }
//     }
//   }

//   void removeItem(String productId) {
//     _cartItems.remove(productId);
//     notifyListeners();
//   }

//   void clearCart() {
//     _cartItems.clear();
//     notifyListeners();
//   }
// // }
// class CartProvider with ChangeNotifier {
//   final Map<String, CartAttr> _cartItems = {};

//   Map<String, CartAttr> get cartItems => _cartItems;

//   double get totalPrice {
//     double total = 0.0;
//     _cartItems.forEach((key, value) {
//       total += value.price * value.quantity;
//     });
//     return total;
//   }

//   void addProductToCart(
//     String productName,
//     String productId,
//     List imageUrl,
//     double price,
//     int quantity,
//     int productQuantity,
//     String vendorId,
//     String productSize,
//     Timestamp scheduleDate,
//   ) {
//     if (_cartItems.containsKey(productId)) {
//       _cartItems.update(
//         productId,
//         (existingCartItem) => CartAttr(
//            businessName: existingCartItem.businessName,
//           productName: existingCartItem.productName,
//           productId: existingCartItem.productId,
//           imageUrl: existingCartItem.imageUrl,
//           quantity: existingCartItem.quantity + 1,
//           productQuantity: existingCartItem.productQuantity,
//           price: existingCartItem.price,
//           vendorId: existingCartItem.vendorId,
//           productSize: existingCartItem.productSize,
//           scheduleDate: existingCartItem.scheduleDate,
//         ),
//       );
//     } else {
//       _cartItems[productId] = CartAttr(
//         productName: productName,
//         productId: productId,
//         imageUrl: imageUrl,
//         quantity: quantity,
//         productQuantity: productQuantity,
//         price: price,
//         vendorId: vendorId,
//         productSize: productSize,
//         scheduleDate: scheduleDate, businessName: '',
//       );
//     }
//     notifyListeners();
//   }

//   // void increment(String productId) {
//   //   if (_cartItems.containsKey(productId)) {
//   //     _cartItems.update(
//   //       productId,
//   //       (existingCartItem) => CartAttr(
//   //         productName: existingCartItem.productName,
//   //         productId: existingCartItem.productId,
//   //         imageUrl: existingCartItem.imageUrl,
//   //         quantity: existingCartItem.quantity + 1,
//   //         productQuantity: existingCartItem.productQuantity,
//   //         price: existingCartItem.price,
//   //         vendorId: existingCartItem.vendorId,
//   //         productSize: existingCartItem.productSize,
//   //         scheduleDate: existingCartItem.scheduleDate,
//   //       ),
//   //     );
//   //     notifyListeners();
//   //   }
//   // }

//   // void decrement(String productId) {
//   //   if (_cartItems.containsKey(productId)) {
//   //     final currentQuantity = _cartItems[productId]!.quantity;
//   //     if (currentQuantity > 1) {
//   //       _cartItems.update(
//   //         productId,
//   //         (existingCartItem) => CartAttr(
//   //           productName: existingCartItem.productName,
//   //           productId: existingCartItem.productId,
//   //           imageUrl: existingCartItem.imageUrl,
//   //           quantity: currentQuantity - 1,
//   //           productQuantity: existingCartItem.productQuantity,
//   //           price: existingCartItem.price,
//   //           vendorId: existingCartItem.vendorId,
//   //           productSize: existingCartItem.productSize,
//   //           scheduleDate: existingCartItem.scheduleDate,
//   //         ),
//   //       );
//   //       notifyListeners();
//   //     }
//   //   }
//   // }

//   void removeItem(String productId) {
//     _cartItems.remove(productId);
//     notifyListeners();
//   }

//   void clearCart() {
//     _cartItems.clear();
//     notifyListeners();
//   }

//   void decrement(String productId) {}

//   void increment(String productId) {}
// // }
// class CartProvider with ChangeNotifier {
//   final Map<String, CartAttr> _cartItems = {};

//   Map<String, CartAttr> get cartItems => _cartItems;

//   double get totalPrice {
//     double total = 0.0;
//     _cartItems.forEach((key, value) {
//       total += value.price * value.quantity;
//     });
//     return total;
//   }

//   void addProductToCart(
//     String productName,
//     String productId,
//     List imageUrl,
//     double price,
//     int quantity,
//     int productQuantity,
//     String vendorId,
//     String productSize,
//     Timestamp scheduleDate,
//   ) {
//     if (_cartItems.containsKey(productId)) {
//       _cartItems.update(
//         productId,
//         (existingCartItem) => CartAttr(
//           bussinessName: existingCartItem.bussinessName,
//           productName: existingCartItem.productName,
//           productId: existingCartItem.productId,
//           imageUrl: existingCartItem.imageUrl,
//           quantity: existingCartItem.quantity + 1,
//           productQuantity: existingCartItem.productQuantity,
//           price: existingCartItem.price,
//           vendorId: existingCartItem.vendorId,
//           productSize: existingCartItem.productSize,
//           scheduleDate: existingCartItem.scheduleDate,
//         ),
//       );
//     } else {
//       _cartItems[productId] = CartAttr(
//         productName: productName,
//         productId: productId,
//         imageUrl: imageUrl,
//         quantity: quantity,
//         productQuantity: productQuantity,
//         price: price,
//         vendorId: vendorId,
//         productSize: productSize,
//         scheduleDate: scheduleDate,
//         bussinessName: '',
//       );
//     }
//     notifyListeners();
//   }

//   void increment(String productId) {
//     if (_cartItems.containsKey(productId)) {
//       final existingCartItem = _cartItems[productId];
//       if (existingCartItem != null &&
//           existingCartItem.quantity < existingCartItem.productQuantity) {
//         _cartItems.update(
//           productId,
//           (existingCartItem) => CartAttr(
//             bussinessName: existingCartItem.bussinessName,
//             productName: existingCartItem.productName,
//             productId: existingCartItem.productId,
//             imageUrl: existingCartItem.imageUrl,
//             quantity: existingCartItem.quantity + 1,
//             productQuantity: existingCartItem.productQuantity,
//             price: existingCartItem.price,
//             vendorId: existingCartItem.vendorId,
//             productSize: existingCartItem.productSize,
//             scheduleDate: existingCartItem.scheduleDate,
//           ),
//         );
//         notifyListeners();
//       }
//     }
//   }

//   void decrement(String productId) {
//     if (_cartItems.containsKey(productId)) {
//       final existingCartItem = _cartItems[productId];
//       if (existingCartItem != null && existingCartItem.quantity > 1) {
//         _cartItems.update(
//           productId,
//           (existingCartItem) => CartAttr(
//             bussinessName: existingCartItem.bussinessName,
//             productName: existingCartItem.productName,
//             productId: existingCartItem.productId,
//             imageUrl: existingCartItem.imageUrl,
//             quantity: existingCartItem.quantity - 1,
//             productQuantity: existingCartItem.productQuantity,
//             price: existingCartItem.price,
//             vendorId: existingCartItem.vendorId,
//             productSize: existingCartItem.productSize,
//             scheduleDate: existingCartItem.scheduleDate,
//           ),
//         );
//         notifyListeners();
//       }
//     }
//   }

//   void removeItem(String productId) {
//     _cartItems.remove(productId);
//     notifyListeners();
//   }

//   void clearCart() {
//     _cartItems.clear();
//     notifyListeners();
//   }
// }
import 'package:flutter/foundation.dart';
import 'package:winkle_final/models/cart_attributes.dart'; // Ensure this import is present for ChangeNotifier

class CartProvider with ChangeNotifier {
  final Map<String, CartAttr> _cartItems = {}; // This is your cart items map
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

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
//  double get totalPrice {
//     double total = 0.0;
//     _cartItems.forEach((key, cartItem) {
//       total += cartItem.price * cartItem.quantity;
//     });
//     return total;
//   }
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

//  Future<void> placeOrder(CartAttr cartData) async {
//     final user = FirebaseAuth.instance.currentUser;
//     // Filter the selected products
//     final selectedItems = _cartItems.values.where((cartItem) => cartItem.isSelected).toList();
//     // Add to the orders collection
//       for (var cartData in selectedItems) {
//       // Add to the orders collection
//       await FirebaseFirestore.instance.collection('orders').add({
//         'buyerId': user!.uid,
//         'productId': cartData.productId,
//         'productName': cartData.productName,
//         'productPrice': cartData.price,
//         'quantity': cartData.quantity,
//         'productImage': cartData.imageUrl,
//         'orderDate': Timestamp.now(),
//         'scheduleDate': cartData.scheduleDate,
//         'accepted': false, // Or based on your logic
//       });
//     }
//     // Optionally show a confirmation or update state
//     notifyListeners();
//   }
  // Similar changes for increment, decrement, removeItem, etc.
// double get selectedItemsTotalPrice {
//   double total = 0.0;
//   _cartItems.forEach((key, cartItem) {
//     if (cartItem.isSelected) {
//       total += cartItem.price * cartItem.quantity;
//     }
//   });
//   return total;
// }

// double get selectedItemsTotalPrice {
//   double total = 0.0;
//   _cartItems.forEach((key, cartItem) {
//     if (cartItem.isSelected) {
//       total += cartItem.price * cartItem.quantity; // Assuming `cartItem.price` is the price of the item and `cartItem.quantity` is how many items are selected
//     }
//   });
//   return total;
// }

// double get selectedItemsTotalPrice {
//   double total = 0.0;
//   _cartItems.forEach((key, cartItem) {
//     if (cartItem.isSelected) {
//       total += cartItem.price * cartItem.quantity;
//     }
//   });
//   return total;
// }
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

