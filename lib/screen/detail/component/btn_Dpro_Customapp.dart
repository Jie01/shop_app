import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

import '../../../size_config.dart';

class Dproduct {
  final Product product;
  Dproduct({@required this.product});
}

class bIconBtn extends StatelessWidget {
  const bIconBtn({
    Key key,
    @required this.iconData,
    @required this.press,
  }) : super(key: key);

  final IconData iconData;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(40),
      height: getProportionateScreenWidth(40),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: Colors.white,
        child: Icon(
          iconData,
        ),
        onPressed: press,
      ),
    );
  }
}

class CustomAppBar extends PreferredSize {
  final double rating;

  CustomAppBar({this.rating});

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            bIconBtn(
              iconData: Icons.arrow_back_ios,
              press: () => Navigator.pop(context),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: Row(
                children: [
                  Text(
                    rating.toString(),
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow[600],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
