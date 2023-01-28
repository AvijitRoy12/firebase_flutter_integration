import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class PatternsProvider with ChangeNotifier {
  PatternsModel? patternsModel;

  List<PatternsModel> search = [];
  productModels(QueryDocumentSnapshot element) {
    patternsModel = PatternsModel(
      productimage: element.get("p_image"),
      productname: element.get("p_name"),
      productprice: element.get("p_price"),
    );
    search.add(patternsModel!);
  }

  List<PatternsModel> patternsList = [];

  fetchPatternsList() async {
    List<PatternsModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("demodatalist").get();

    value.docs.forEach((element) {
      patternsModel = PatternsModel(
        productname: element.get("p_name"),
        productprice: element.get("p_price"),
        productimage: element.get("p_image"),
      );
      newList.add(patternsModel!);
    });
    patternsList = newList;
    notifyListeners();
  }

  List<PatternsModel> get getPatternsList {
    return patternsList;
  }
}
