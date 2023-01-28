import 'package:ecommerce_app/controller/data_controller.dart';
import 'package:ecommerce_app/views/addproduct_screen.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'drawer_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Gallery'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(AddProductScreen());
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(children: const []),
    );
  }
}
