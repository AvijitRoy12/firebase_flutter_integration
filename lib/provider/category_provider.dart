import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Product {
  final String name;
  final String image;
  Product({
    required this.image,
    required this.name,
  });
}

class CategoryProvider with ChangeNotifier {
  List shirt = [];
  late Product shirtData;

  Future<void> getShirtData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("1rZGxn6wweT7jqAHrnUr")
        .collection("shirt")
        .get();
    for (var element in shirtSnapShot.docs) {
      shirtData = Product(
        image: element["image"],
        name: element["name"],
      );
      newList.add(shirtData);
    }
    shirt = newList;
    notifyListeners();
  }
}
