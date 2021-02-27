import 'package:flutter/material.dart';
import 'package:shop_app/screen/Sign_up/Sign_up.dart';

import '../constants.dart';
import '../size_config.dart';

class NoAcc extends StatelessWidget {
  const NoAcc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(14)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Sign_up.routeName);
          },
          child: Text(
            "Sign up now",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(14), color: kprimaryc),
          ),
        ),
      ],
    );
  }
}
