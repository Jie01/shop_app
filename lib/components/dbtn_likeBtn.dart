import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/product.dart';

import '../constants.dart';
import '../size_config.dart';

class DBtn extends StatelessWidget {
  const DBtn({
    Key key,
    this.text,
    this.pressed,
  }) : super(key: key);

  final String text;
  final Function pressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(56),
      width: double.infinity,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: pressed,
        color: kprimaryc,
        child: Text(
          text,
          style: TextStyle(
              fontSize: getProportionateScreenWidth(18), color: Colors.white),
        ),
      ),
    );
  }
}

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key key,
    this.icon,
    this.press,
  }) : super(key: key);

  final String icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        height: getProportionateScreenHeight(47),
        width: getProportionateScreenWidth(47),
        decoration: BoxDecoration(
          color: Color(0xfff1f2f5),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}

class likeBtn extends StatefulWidget {
  const likeBtn({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _likeBtnState createState() => _likeBtnState();
}

class _likeBtnState extends State<likeBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.product.isFavourite = !widget.product.isFavourite;
        });
        if (widget.product.isFavourite) {
          likeProduct.add(widget.product);
        } else if (widget.product.isFavourite == false) {
          likeProduct.removeWhere((element) => element.id == widget.product.id);
        }
      },
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: getProportionateScreenWidth(30),
        height: getProportionateScreenWidth(30),
        decoration: BoxDecoration(
          color: widget.product.isFavourite
              ? kprimaryc.withOpacity(0.15)
              : kSecondc.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.favorite,
          color: widget.product.isFavourite
              ? kprimaryc
              : kSecondc.withOpacity(0.1),
          size: 20,
        ),
      ),
    );
  }
}
