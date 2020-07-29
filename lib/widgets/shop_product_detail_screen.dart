import 'package:flutter/material.dart';
import 'package:flutter_dev/providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  
  static const routeName='/product-details';
  
  @override
  Widget build(BuildContext context) {
    final productId= ModalRoute.of(context).settings.arguments as String;
    final loadedProduct= Provider.of<Products>(context).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}