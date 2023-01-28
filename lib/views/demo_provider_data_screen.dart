import 'package:ecommerce_app/controller/data_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderTestScreen extends StatefulWidget {
  const ProviderTestScreen({super.key});

  @override
  State<ProviderTestScreen> createState() => _ProviderTestScreenState();
}

class _ProviderTestScreenState extends State<ProviderTestScreen> {
  DataProvider dataProvider = DataProvider();

  @override
  void initState() {
    DataProvider initproductProvider = Provider.of(context, listen: false);
    initproductProvider.fatchDemoProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
              color: Colors.red,
              child: Column(
                children: [
                  Text(dataProvider.demoData!.productName),
                  Text('${dataProvider.demoData!.productPrice}'),
                ],
              ))
        ],
      ),
    ));
  }
}
