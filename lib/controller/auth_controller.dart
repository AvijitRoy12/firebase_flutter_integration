import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../views/home_screen.dart';

class AuthController extends GetxController {
  var userId;
  Future<void> userSignUp(email, password, username) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      try {
        var response =
            await FirebaseFirestore.instance.collection('userslist').add({
          'user_Id': userCredential.user!.uid,
          'user_name': username,
          "password": password,
          'joinDate': DateTime.now().millisecondsSinceEpoch,
          'email': email
        });
        print("Firebase response1111 ${response.id}");
      } catch (exception) {
        print("Error Saving Data at firestore $exception");
      }
      EasyLoading.showSuccess("Account created");
      Get.back();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> userSignIn(email, password) async {
    print('$email, $password');
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      userId = userCredential.user!.uid;
      EasyLoading.showSuccess("Login Successful");
      Get.to(HomeScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        EasyLoading.showError("No user found for that email");
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        EasyLoading.showError("wrong-password");
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();}
}
