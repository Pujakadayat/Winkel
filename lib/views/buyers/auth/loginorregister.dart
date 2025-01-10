import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:winkle_final/views/buyers/auth/login_screen.dart';



class LoginOrRegisterPage extends StatefulWidget {

 const LoginOrRegisterPage({Key? key}) : super(key: key);

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
//initially show login page
bool showLoginPage = true;

//toggle between login and register page
void togglePages(){
setState(() {
  showLoginPage = !showLoginPage;
});
}

  @override
  Widget build(BuildContext context) {
   if(showLoginPage){
    return LoginScreen(
      // onTap:togglePages, context: context,
    );
   }else{
    return RegisterScreen(
      // onTap: togglePages, context: context,
    );
   
    }
  }
}