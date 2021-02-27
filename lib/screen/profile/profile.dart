import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/enum.dart';
import 'package:shop_app/models/Cutom_appbar.dart';
import 'body.dart';

class Profile extends StatelessWidget {
  static String routeName = "/profile";

  get kPrimaryColor => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottombar(
        selected: MenuState.profile,
      ),
    );
  }
}
