import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'btn_Dpro_Customapp.dart';

class Chosecol extends StatefulWidget {
  const Chosecol({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;
  @override
  ChosecolState createState() => ChosecolState();
}

class ChosecolState extends State<Chosecol> {
  int scolor = 0;
  static int added = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
            widget.product.colors.length,
            (index) => ColorDot(
              color: widget.product.colors[index],
              selected: scolor == index,
              press: () {
                setState(() {
                  scolor = index;
                });
              },
            ),
          ),
          Spacer(),
          bIconBtn(
            iconData: Icons.remove,
            press: () {
              if (added != 1) {
                setState(() {
                  added--;
                });
              }
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              added.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          bIconBtn(
            iconData: Icons.add,
            press: () {
              if (added < 20) {
                setState(() {
                  added++;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key key,
    @required this.color,
    this.selected = false,
    this.press,
  }) : super(key: key);

  final Color color;
  final bool selected;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(right: 2),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: selected ? kprimaryc : Colors.transparent,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
