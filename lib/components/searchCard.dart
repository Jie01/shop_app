import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

import '../constants.dart';
import '../size_config.dart';

class searchCard extends StatelessWidget {
  const searchCard({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: getProportionateScreenWidth(88),
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xfff5f6f9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(product.images[0]),
              ),
            ),
          ),
          Container(
            width: getProportionateScreenWidth(20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: TextStyle(fontSize: 16, color: Colors.black),
                maxLines: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Text.rich(
                TextSpan(
                  text: "\$${product.price} ",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: kprimaryc,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
