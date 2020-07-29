import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../models/shop_product.dart';

class Products with ChangeNotifier{
 
 List<Product> _items=[Product(
    id: 'p1', 
    title: 'T-Shirt', 
    description: 'Black T - Shirt ', 
    price: 200.0, 
    imageUrl: 'https://lp2.hm.com/hmgoepprod?set=quality[79],source[/b1/6e/b16e4c7d672dc9ae8503cb0a88713a0aeca57ab1.jpg],origin[dam],category[men_tshirtstanks_bestbasics],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]',
    ),
    Product(
      id: 'p2', 
      title: 'Kurta ', 
      description: 'Long Simple Kurta', 
      price: 399, 
      imageUrl: 'https://cdn1.ninecolours.com/image/cache/products-2018/June-2019/Cotton-Plain-Kurti-In-Yellow-Colour-KR2541528-A-1200x1799.jpg'
      ),
      Product(
        id: 'p3', 
        title: 'Sari', 
        description: 'Fashionable Sari', 
        price: 699, 
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRez3L8BC4WaIRIIi-tPBzS_IrN9i4ZWDocMQ&usqp=CAU',
        ),
        Product(
          id: 'p4', 
          title: 'Indo Western', 
          description: 'Indo western in lehenga', 
          price: 1400, 
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSdEsnhtu8iSdOf6A6lwepy4ARFfQJVKzEFAQ&usqp=CAU',
            ),
];

 List<Product> get items{
   return [..._items];
 }
 Product findById(String id)
 {
    return _items.firstWhere((prod) =>prod.id==id );
 }
 void addProduct(){
  // _items.add(value);
   notifyListeners();
 }
}