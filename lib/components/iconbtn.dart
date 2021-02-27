import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class IconBtn extends StatelessWidget {
  const IconBtn({
    Key key,
    @required this.icon,
    this.num = 0,
    @required this.press,
  }) : super(key: key);

  final icon;
  final int num;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            height: getProportionateScreenWidth(46),
            width: getProportionateScreenWidth(46),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kSecondc.withOpacity(0.15),
            ),
            child: Icon(
              icon,
              color: ktextc,
            ),
          ),
          num == 0
              ? Container()
              : Positioned(
                  right: 0,
                  top: -3,
                  child: Container(
                    height: getProportionateScreenWidth(16),
                    width: getProportionateScreenWidth(16),
                    decoration: BoxDecoration(
                      color: Colors.red[600],
                      shape: BoxShape.circle,
                      border: Border.all(width: 1.5, color: Colors.white),
                    ),
                    child: Center(
                      child: Text(
                        num.toString(),
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(10),
                          height: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
