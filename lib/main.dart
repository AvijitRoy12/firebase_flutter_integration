import 'package:ecommerce_app/provider/category_provider.dart';
import 'package:ecommerce_app/views/login_screen.dart';
import 'package:ecommerce_app/views/provider_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    LoginScreen(),
  );
}
