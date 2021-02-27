import 'package:flutter/material.dart';
import 'package:shop_app/screen/forget_pass/body.dart';

class Forget_pass extends StatelessWidget {
  static String routeName = "/forgot_pass";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Forgot Password"),
      ),
      body: Body(),
    );
  }
}
