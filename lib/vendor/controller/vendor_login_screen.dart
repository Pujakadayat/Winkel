import 'package:flutter/material.dart';
import 'package:winkle_final/controllers/auth_controller.dart';
import 'package:winkle_final/utils/show_snackBar.dart';
import 'package:winkle_final/vendor/vendor_screens/main_vendor_screen.dart';
import 'package:winkle_final/vendor/views/auth/vendor_auth_screen.dart';
import 'package:winkle_final/vendor/views/auth/vendor_registeration_screen.dart';



class VendorLoginScreen extends StatefulWidget {
  @override
  State<VendorLoginScreen> createState() => _VendorLoginScreenState();
}

class _VendorLoginScreenState extends State<VendorLoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthController _authcontroller = AuthController();
  late String email;
  late String password;

  bool _isLoading = false;
  
_loginUsers() async {
  setState(() {
    _isLoading = true;
  });

  if (_formKey.currentState!.validate()) {
    String res = await _authcontroller.loginUsers(email, password);

    if (res == 'success') {
      // Navigate to the main vendor screen on successful login
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return MainVendorScreen();
      }));
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnack(context, res); // Show the error message returned from `loginUsers()`
    }
  } else {
    setState(() {
      _isLoading = false;
    });
    showSnack(context, 'Please fill out all fields.');
  }
}

  // _loginUsers() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   if (_formKey.currentState!.validate()) {
  //     String res = await _authcontroller.loginUsers(email, password);

  //     if (res == 'success') {
  //       return Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (BuildContext context) {
  //         return MainVendorScreen();
  //       }));
  //     } else {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       return snowSnack(context, res);
  //     }
  //   } else {
  //     return showSnack(context, 'Please fields must not be empty');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login Vendor's Account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Email field must not be empty';
                    } else {
                      return null;
                    }
                  },
                  onChanged: ((value) {
                    email = value;
                  }),
                  decoration: InputDecoration(
                    labelText: 'Enter Email Address',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Password field must not be empty';
                    } else {
                      return null;
                    }
                  },
                  onChanged: ((value) {
                    password = value;
                  }),
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  _loginUsers();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 13, 62, 86),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: _isLoading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'Login',
                            style: TextStyle(
                              letterSpacing: 5,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Need An Account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return VendorRegistrationScreen();
                      })));
                    },
                    child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          // letterSpacing: 4,
                        ),
                      ),
                    ),
                  )
                ],
              ),
             
               SizedBox(
                height: 10,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Register yourself with winkle'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return VendorAuthScreen();
                      })));
                    },
                    child: Center(
                      child: Text(
                        'Click here',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          // letterSpacing: 4,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  snowSnack(BuildContext context, String s) {}
}
