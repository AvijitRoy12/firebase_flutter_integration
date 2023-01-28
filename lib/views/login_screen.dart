import 'package:ecommerce_app/views/demo_data_screen.dart';
import 'package:ecommerce_app/views/demo_provider_data_screen.dart';
import 'package:ecommerce_app/views/provider_test.dart';
import 'package:ecommerce_app/views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import '../screens/category.dart';
import '../screens/general_products.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        color: const Color(0xFF151026),
      )),
      builder: EasyLoading.init(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Firebase & Flutter'),
        ),
        body: Card(
          child: Container(
            padding: const EdgeInsets.all(10),
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
                    const SizedBox(
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
                    const SizedBox(
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
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      child: const Text('Login Now'),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => SignUpScreen());
                        },
                        child: const Text("Need an account? SignUp")),
                    TextButton(
                      onPressed: () {
                        Get.to(() => DemoDataScreen());
                      },
                      child: const Text("Demo Data"),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => HomePage());
                      },
                      child: const Text("Provider Data"),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => Home());
                      },
                      child: const Text("Products"),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => MyWidget());
                      },
                      child: const Text("Clothing"),
                    ),
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
