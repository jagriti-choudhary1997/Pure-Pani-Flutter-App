import 'package:flutter/material.dart';
import '../providers/products.dart';
import './shop_product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

   final productsData = Provider.of<Products>(context);
   final products=productsData.items;
    return GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          ), 
        itemBuilder: (ctx,i)=> Productitem(
          products[i].id ,
          products[i].title,
          products[i].imageUrl),
        );
  }
}