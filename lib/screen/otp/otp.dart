import 'package:flutter/material.dart';

import 'body.dart';

class Otp extends StatelessWidget {
  static String routeName = '/otp';
  static String phoneN;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("OTP Verification"),
      ),
      body: Body(
        phone: phoneN,
      ),
    );
  }
}
