import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/product.dart';

class Cart {
  final Product product;
  final int numItem;

  Cart({@required this.product, @required this.numItem});
}

List<Cart> demoCarts = [
  Cart(product: demoProducts[0], numItem: 2),
  Cart(product: demoProducts[1], numItem: 1),
  Cart(product: demoProducts[3], numItem: 1),
];
