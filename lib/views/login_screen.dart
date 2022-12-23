import 'package:ecommerce_app/views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../controller/authentication_methods.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  Map<String, String> userLoginData = {"email": "", "password": ""};

  AuthController authController = Get.put(AuthController());

  login() {
    if (_formKey.currentState!.validate()) {
      print("Form is valid ");
      _formKey.currentState!.save();
      authController.userSignIn(
          userLoginData["email"], userLoginData["password"]);
      print(userLoginData);
      print('Data for login $userLoginData');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 12, 32, 47),
          centerTitle: true,
          title: Text('Firebase & Flutter'),
        ),
        body: Card(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          filled: true,
                          hintText: 'Username',
                          fillColor: Colors.blue.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email Required';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        userLoginData['email'] = value!;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: true,
                          hintText: 'Password',
                          fillColor: Colors.blue.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password Required';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        userLoginData['password'] = value!;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: login,
                      child: Text('Login Now'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => SignUpScreen());
                        },
                        child: Text("Need an account? SignUp"))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:ecommerce_app/controller/authentication_methods.dart';
// import 'package:ecommerce_app/views/signup_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   Map<String, String> userLoginData = {"email": "", "password": ""};
//   AuthController authController = Get.put(AuthController());

// login() {
//   if (_formKey.currentState!.validate()) {
//     print("Form is valid ");
//     _formKey.currentState!.save();
//     authController.userSignIn(
//         userLoginData["email"], userLoginData["password"]);
//     print(userLoginData);
//     print('Data for login $userLoginData');
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text('Firebase & Flutter'),
//           backgroundColor: Color.fromARGB(255, 12, 32, 47),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//             Center(
//               child: Text(
//                 'Login',
//                 style: TextStyle(
//                     fontSize: 25,
//                     color: Colors.blueGrey,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             TextFormField(
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(
//                   filled: true,
//                   hintText: 'Email',
//                   fillColor: Colors.blue.shade100,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   )),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Email Required';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 userLoginData['email'] = value!;
//               },
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               obscureText: true,
//               decoration: InputDecoration(
//                   filled: true,
//                   hintText: 'Password',
//                   fillColor: Colors.blue.shade100,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   )),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Password Required';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 userLoginData['password'] = value!;
//               },
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Builder(builder: (context) {
//               return ElevatedButton(
//                 onPressed: (() {
//                   authController.userSignIn(
//                       userLoginData["email"], userLoginData["password"]);
//                   print(userLoginData);
//                 }),
//                 child: Text('Login'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black,
//                   minimumSize: const Size.fromHeight(50), // NEW
//                 ),
//               );
//             }),
//             SizedBox(
//               height: 10,
//             ),
//             Builder(builder: (context) {
//               return GestureDetector(
//                   onTap: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => SignUpScreen()),
//                       ),
//                   child: Text(
//                     'need an account? signup',
//                   ));
//             }),
//           ]),
//         ),
//       ),
//     );
//   }
// }
