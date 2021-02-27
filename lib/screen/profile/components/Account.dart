import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/components/photo.dart';
import 'package:shop_app/models/save.dart';
import 'package:shop_app/services/helper.dart';
import 'package:shop_app/size_config.dart';

import '../../../constants.dart';

class Account extends StatelessWidget {
  static String routeName = "/components/account";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Account"),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  final File image;

  const Body({Key key, this.image}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();

  List<String> coupon = [
    "New Year Coupon \$20",
    "New Year Coupon \$20",
    "New Year Coupon \$20",
    "New Year Coupon \$20",
    "New Year Coupon \$20",
    "New Year Coupon \$20",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          Photo(),
          SizedBox(
            height: SizeConfig.screenHeight * 0.05,
          ),
          Text(
            "Welcome $myName",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          AccCard(
            text: myName != null ? myName : "",
            icons: Icons.person_outline,
          ),
          AccCard(
            text: gmail,
            icons: Icons.email,
          ),
          Wallet(money: money, coupon: coupon),
        ],
      ),
    );
  }
}

class Wallet extends StatelessWidget {
  const Wallet({
    Key key,
    @required this.money,
    @required this.coupon,
  }) : super(key: key);

  final double money;
  final List<String> coupon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xfff3f4f7),
        ),
        child: Column(
          children: [
            Text(
              "Your Wallet",
              style: TextStyle(fontSize: 16),
            ),
            ListTile(
              leading: Text("Money:"),
              title: Text("\$$money", maxLines: 1),
            ),
            Container(
              color: Colors.grey[600],
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 10),
              height: 1.5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("coupon:"),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: SizeConfig.screenHeight * 0.19,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                            coupon.length,
                            (index) => Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(coupon[index]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccCard extends StatelessWidget {
  const AccCard({
    Key key,
    @required this.text,
    this.icons,
  }) : super(key: key);

  final String text;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xfff3f4f7),
      ),
      child: Row(
        children: [
          Icon(
            icons,
            size: 30,
            color: kprimaryc,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
