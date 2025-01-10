
import 'dart:io';


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:winkle_final/controllers/auth_controller.dart';
import 'package:winkle_final/provider/cart_provider.dart';
import 'package:winkle_final/provider/themeprovider.dart';

import 'package:winkle_final/provider/product_provider.dart';
import 'package:winkle_final/vendor/controller/vendor_login_screen.dart';
import 'package:winkle_final/vendor/views/auth/vendor_auth_screen.dart';
import 'package:winkle_final/views/buyers/auth/login_screen.dart';
import 'package:winkle_final/views/buyers/productDetail/product_detail_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase for Android (conditionally)
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDi2EKBcNqHKrlSpvRgjRR67ZDw4PLosUU",
        appId: "1:6329481609:android:4d8e8a3e0cb52d4c99c958",
        messagingSenderId: "6329481609",
        projectId: "multi-vendor-app-7c8e0",
        storageBucket: "multi-vendor-app-7c8e0.appspot.com",
      ),
    ).then((value) {
      Get.put(AuthController()); // Assuming AuthController is correctly initialized
      Stripe.publishableKey =
          // "pk_test_51Nv0TYLcpVDSklU4eoI285cQsT6Lr0w0YuHR5Aaj2Tx8hhLtkBJS6adO2yC0kcAesDO9jfN0PK4sfcs6oelLXowX006uEcO1Dw"
         "pk_test_51QdQMoQwsrp6SwiKZK84qOhiVl6vPsguYwYgcThMEX2QYaMSwKcYW904bGz2Hn9tRk6TRSpOWzIJowEgqLF1ruGl00HHGPScjZsecret" ;
    });
  } else {
    await Firebase.initializeApp(); // For other platforms like iOS
  }

  // runApp(
  //   riverpod.ProviderScope(  // Wrap your app with ProviderScope first for Riverpod
  //     child: MultiProvider(  // Then use MultiProvider for the 'provider' package
  //       providers: [
  //         ChangeNotifierProvider(create: (_) => ProductProvider()),
  //         ChangeNotifierProvider(create: (_) => CartProvider()),
  //          ChangeNotifierProvider(create: (_) => ThemeProvider(applicationcontext: context)),
  //       ],
  //       child: const MyApp(),
  //     ),
  //   ),
  // );
  runApp(
  riverpod.ProviderScope(
    child: Builder(
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProductProvider()),
          ChangeNotifierProvider(create: (context) => CartProvider()),
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(applicationcontext: context),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  ),
);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Brand-Bold',
      ),  
      // home: LoginScreen(),
   home:VendorLoginScreen(),
      // home: VendorAuthScreen(),
      //  // You can change this to CheckoutScreen() or another screen
//  home:ReviewInputWidget(onSubmit: (String , int ) {  },),
      builder: EasyLoading.init(),
    );
  }

}
