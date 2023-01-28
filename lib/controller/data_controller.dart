import 'dart:io';

import 'package:ecommerce_app/controller/auth_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product_model.dart';

class DataController extends GetxController {
  //Instance of firebase
  final firebaseInstance = FirebaseFirestore.instance;

//Empty list for coming data from firebase
  List<Product> loginUserData = [];
  List<DemoProduct> demoProductData = [];

  Map userProfileData = {'userName': '', 'joinDate': ''};
  AuthController authController = Get.find();

//Load data on app launch
  void onReady() {
    super.onReady();
    getUserProfileData();
  }

//Get user profile data from firebsae
  Future<void> getUserProfileData() async {
    // print("user id ${authController.userId}");
    try {
      var response = await firebaseInstance
          .collection('userslist')
          .where('user_Id', isEqualTo: authController.userId)
          .get();
      // response.docs.forEach((result) {
      //   print(result.data());
      // });
      if (response.docs.isNotEmpty) {
        userProfileData['userName'] = response.docs[0]['user_name'];
        userProfileData['joinDate'] = response.docs[0]['joinDate'];
        userProfileData['email'] = response.docs[0]['email'];
      }
      print(userProfileData);
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
  }

//Add new product to firebase by user
  Future<void> addNewProduct(Map productdata, File image) async {
    var pathimage = image.toString();
    var temp = pathimage.lastIndexOf('/');
    var result = pathimage.substring(temp + 1);
    final ref =
        FirebaseStorage.instance.ref().child('product_images').child(result);
    var response = await ref.putFile(image);
    print("Updated $response");
    var imageUrl = await ref.getDownloadURL();

    try {
      var response = await firebaseInstance.collection('productlist').add({
        'product_name': productdata['p_name'],
        'product_price': productdata['p_price'],
        "product_upload_date": productdata['p_upload_date'],
        'product_image': imageUrl,
        'user_Id': authController.userId,
        "phone_number": productdata['phone_number'],
      });
      print("Firebase response1111 $response");
      Get.back();
    } catch (exception) {
      print("Error Saving Data at firestore $exception");
    }
  }

//Display product data in app from firebase
  Future<void> getLoginUserProduct() async {
    print("loginUserData YEs $loginUserData");
    loginUserData = [];
    try {
      final List<Product> lodadedProduct = [];
      var response = await firebaseInstance
          .collection('productlist')
          .where('user_Id', isEqualTo: authController.userId)
          .get();

      if (response.docs.isNotEmpty) {
        for (var result in response.docs) {
          print(result.data());
          print("Product ID  ${result.id}");
          lodadedProduct.add(
            Product(
                productId: result.id,
                userId: result['user_Id'],
                productname: result['product_name'],
                productprice: double.parse(result['product_price']),
                productimage: result['product_image'],
                phonenumber: int.parse(result['phone_number']),
                productuploaddate: result['product_upload_date'].toString()),
          );
        }
      }
      loginUserData.addAll(lodadedProduct);
      update();
    } on FirebaseException catch (e) {
      print("Error $e");
    } catch (error) {
      print("error $error");
    }
  }

//Display demo data from firebase in app
  Future<void> getDemoProductData() async {
    print("loginUserData YEs $loginUserData");

    demoProductData = [];

    try {
      final List<DemoProduct> lodadedDemoProduct = [];
      var response = await firebaseInstance.collection('datalistest').get();

      if (response.docs.isNotEmpty) {
        for (var result in response.docs) {
          print(result.data());
          print("Product ID  ${result.id}");
          lodadedDemoProduct.add(
            await DemoProduct(
              productimage: result['p_image'],
              productname: result['p_name'].toString(),
              productprice: double.parse(result['p_price'].toString()),
            ),
          );
        }
      }
      demoProductData.addAll(lodadedDemoProduct);
      update();
    } on FirebaseException catch (e) {
      print("Error $e");
    } catch (error) {
      print("error $error");
    }
  }
}
