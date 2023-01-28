import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'general_products.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final List category = [];
  final _firestoreInstance = FirebaseFirestore.instance;

  fetchCategory() async {
    QuerySnapshot qn = await _firestoreInstance
        .collection("clothes")
        .doc('kLywT6tOvXZXRfc3y2Sc')
        .collection('women')
        .get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        category.add({
          "image": qn.docs[i]["image"],
          "name": qn.docs[i]["name"],
        });
      }
    });
    return qn.docs;
  }

  @override
  void initState() {
    fetchCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.5),
                itemCount: category.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Home())),
                    child: Card(
                      elevation: 3,
                      child: Column(
                        children: [
                          AspectRatio(
                              aspectRatio: 2,
                              child: Container(
                                  color: const Color.fromARGB(255, 65, 65, 65),
                                  child: Image.network(
                                    category[index]["image"],
                                    fit: BoxFit.cover,
                                  ))),
                          Text("Product: ${category[index]["name"]}"),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      )),
    );
  }
}
