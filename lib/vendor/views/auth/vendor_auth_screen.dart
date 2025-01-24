
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:winkle_final/vendor/vendor_screens/landing_screen.dart';
import 'package:winkle_final/vendor/views/auth/vendor_registeration_screen.dart';




// class VendorAuthScreen extends StatelessWidget {
//   const VendorAuthScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
      
//       // If the user is already signed-in, use it as initial data
//       initialData: FirebaseAuth.instance.currentUser,
//       builder: (context, snapshot) {
//         // User is not signed in
//         if (!snapshot.hasData) {
//           return SignInScreen(providers: [
//             EmailAuthProvider(),
//           ],
//           actions: [
//               AuthStateChangeAction<SignedIn>((context, state) {
//                 // Navigate to the registration screen upon successful sign-in
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>VendorRegistrationScreen(),
//                   ),
//                 );
//               }),
//             ],);
//         }
//         await FirebaseAuth.instance.signOut();

//         // Render your application if authenticated
//         //return  VendorRegistrationScreen();
//    return const Text('Authenticated');
//       },
//     );
//   }
// }

// class VendorAuthScreen extends StatelessWidget {
//   const VendorAuthScreen({super.key});

//   Future<void> _signOut() async {
//     await FirebaseAuth.instance.signOut();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       initialData: FirebaseAuth.instance.currentUser,
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return SignInScreen(
//             providers: [
//               EmailAuthProvider(),
//             ],
           
//           );
//         }
        
//         // Call sign out when needed
//         _signOut();
        
//         return VendorRegistrationScreen();
//       },
//     );
//   }
// }

class VendorAuthScreen extends StatelessWidget {
  const VendorAuthScreen({super.key});

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [
              EmailAuthProvider(),
            ],
            actions: [
              // Add this AuthStateChangeAction to handle navigation after sign-in
              AuthStateChangeAction<SignedIn>((context, state) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VendorRegistrationScreen(),
                  ),
                );
              }),
            ],
          );
        }

        return VendorRegistrationScreen();
      },
    );
  }
}