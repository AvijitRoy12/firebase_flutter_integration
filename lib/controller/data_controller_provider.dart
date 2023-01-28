import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class DataProvider with ChangeNotifier {
  //Display data using provider on demo provider_data_screen
  DemoDataModel? demoData;

  List<DemoDataModel> search = [];

  productModels(QueryDocumentSnapshot element) {
    demoData = DemoDataModel(
      productName: element.get("product_name"),
      productPrice: element.get("product_price"),
    );
    search.add(demoData!);
  }

  List<DemoDataModel> demoProviderList = [];

  fatchDemoProductData() async {
    List<DemoDataModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("demoproviderdata").get();

    value.docs.forEach(
      (element) {
        productModels(element);

        newList.add(demoData!);
      },
    );
    demoProviderList = newList;
    notifyListeners();
  }
}
