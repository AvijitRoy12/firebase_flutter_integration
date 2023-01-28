import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/provider/category_provider.dart';
import 'package:ecommerce_app/screens/product_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List _products = [];
  final List _shirts = [];
  final _firestoreInstance = FirebaseFirestore.instance;

  fetchShoesData() async {
    QuerySnapshot qn = await _firestoreInstance
        .collection("category")
        .doc("1rZGxn6wweT7jqAHrnUr")
        .collection("shoes")
        .get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _products.add({
          "image": qn.docs[i]["image"],
          "name": qn.docs[i]["name"],
        });
      }
    });

    return qn.docs;
  }

  fetchShirtsData() async {
    QuerySnapshot qn = await _firestoreInstance
        .collection("category")
        .doc("1rZGxn6wweT7jqAHrnUr")
        .collection("shirts")
        .get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _shirts.add({
          "image": qn.docs[i]["image"],
          "name": qn.docs[i]["name"],
        });
      }
    });

    return qn.docs;
  }

  ////working with provider

  @override
  void initState() {
    fetchShoesData();
    fetchShirtsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, childAspectRatio: 1.5),
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ProductDetails(_shirts[index]))),
                      child: Card(
                        elevation: 3,
                        child: Column(
                          children: [
                            AspectRatio(
                                aspectRatio: 2,
                                child: Container(
                                    color:
                                        const Color.fromARGB(255, 65, 65, 65),
                                    child: Image.network(
                                      _products[index]["image"],
                                      fit: BoxFit.cover,
                                    ))),
                            Text("Product: ${_products[index]["name"]}"),
                            Text("Product: ${_shirts[index]["name"]}"),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
