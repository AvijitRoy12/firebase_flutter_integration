class Product {
  final String productname;
  final double productprice;
  final String productuploaddate;
  final String productimage;
  final String userId;
  final int phonenumber;
  final String productId;

  Product(
      {required this.productname,
      required this.productprice,
      required this.productuploaddate,
      required this.userId,
      required this.productimage,
      required this.phonenumber,
      required this.productId});
}

class DemoProduct {
  final String productname;
  final double productprice;
  final String productimage;

  DemoProduct(
      {required this.productname,
      required this.productprice,
      required this.productimage});
}

class DemoDataModel {
  final String productName;
  final double productPrice;

  DemoDataModel({
    required this.productName,
    required this.productPrice,
  });
}

class PatternsModel {
  String? productname;
  String? productprice;
  double? productimage;

  PatternsModel(
      {required this.productname,
      required this.productprice,
      required this.productimage});
}
