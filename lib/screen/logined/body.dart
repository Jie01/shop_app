import 'package:flutter/material.dart';
import 'package:shop_app/components/dbtn_likeBtn.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screen/home/home.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.6,
        ),
        Text(
          "Login success",
          style: kheading,
        ),
        Spacer(),
        Container(
          width: SizeConfig.screenWidth * 0.6,
          child: DBtn(
            text: "Back to home",
            pressed: () {
              Navigator.pushReplacementNamed(context, Home.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
