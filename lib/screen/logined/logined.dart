import 'package:flutter/material.dart';
import 'package:shop_app/services/helper.dart';

import '../../constants.dart';
import 'body.dart';

class LoginedIn extends StatefulWidget {
  static String routeName = "/logined_In";
  @override
  _LoginedInState createState() => _LoginedInState();
}

class _LoginedInState extends State<LoginedIn> {
  @override
  void initState() {
    getuserinfo();
    super.initState();
  }

  getuserinfo() async {
    myName = await HelperFunc.getusername();
    gmail = await HelperFunc.getuseremail();
    setState(() {});
    print("$gmail is gmail $myName is name");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Login Success"),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
