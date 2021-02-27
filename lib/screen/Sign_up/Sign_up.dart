import 'package:flutter/material.dart';
import 'file:///C:/Users/Acer/AndroidStudioProjects/shop_app/lib/screen/Sign_up/component/body.dart';

class Sign_up extends StatelessWidget {
  static String routeName = "/Sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign Up"),
      ),
      body: Body(),
    );
  }
}
