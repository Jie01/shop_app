import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/dbtn_likeBtn.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/save.dart';
import 'package:shop_app/screen/sign_in/sign_in_screen.dart';
import 'package:shop_app/screen/splash/components/splash_content.dart';
import 'package:shop_app/size_config.dart';

class body extends StatefulWidget {
  @override
  _bodyState createState() => _bodyState();
}

class _bodyState extends State<body> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {"text": "Welcome to SSDC, Let’s shop!", "image": "assets/images/01.jpg"},
    {
      "text":
          "We help people conect with store \naround United State of America",
      "image": "assets/images/02.jpg"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/03.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                    onPageChanged: (val) {
                      setState(() {
                        currentPage = val;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => splashContent(
                          text: splashData[index]["text"],
                          image: splashData[index]["image"],
                        )),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index),
                        ),
                      ),
                      DBtn(
                        text: "Continue",
                        pressed: () {
                          Navigator.pushNamed(context, SignIn.routeName);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: kAnimationDura,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kprimaryc : Colors.grey[350],
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
