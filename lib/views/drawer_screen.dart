import 'package:ecommerce_app/controller/data_controller.dart';
import 'package:ecommerce_app/views/login_screen.dart';
import 'package:ecommerce_app/views/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';

import 'login_user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  final DataController dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 220,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.black),
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'User Name: ${dataController.userProfileData['userName']}',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    FittedBox(
                      child: Text(
                        'Join Date: ${DateFormat.yMMMMd().format(DateTime.fromMillisecondsSinceEpoch(dataController.userProfileData['joinDate'])).toString()} ',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        'Email: ${dataController.userProfileData['email']}',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: const Text('Your Product'),
                onTap: () {
                  Get.back();
                  Get.to(() => LoginUserProductScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.to(SignUpScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
