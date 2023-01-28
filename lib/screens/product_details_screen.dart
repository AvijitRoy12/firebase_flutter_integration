import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  var _product;
  ProductDetails(this._product);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: NetworkImage(widget._product['image'])),
            // AspectRatio(
            //   aspectRatio: 3.5,
            //   child: CarouselSlider(
            //       items: widget._product['product-img']
            //           .map<Widget>((item) => Padding(
            //                 padding: const EdgeInsets.only(left: 3, right: 3),
            //                 child: Container(
            //                   decoration: BoxDecoration(
            //                       image: DecorationImage(
            //                           image: NetworkImage(
            //                               item.data()['product-img']),
            //                           fit: BoxFit.fitWidth)),
            //                 ),
            //               ))
            //           .toList(),
            //       options: CarouselOptions(
            //           autoPlay: false,
            //           enlargeCenterPage: true,
            //           viewportFraction: 0.8,
            //           enlargeStrategy: CenterPageEnlargeStrategy.height,
            //           onPageChanged: (val, carouselPageChangedReason) {
            //             setState(() {});
            //           })),
            // ),
            Text(
              widget._product['name'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            // Text(widget._product['product-description']),
            SizedBox(
              height: 10,
            ),
            Text(
              "\$ ${widget._product['name'].toString()}",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 30, color: Colors.red),
            ),
            Divider(),
            SizedBox(
              width: 1,
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Add to cart",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  elevation: 3,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
