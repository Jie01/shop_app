import 'package:flutter/material.dart';
import 'package:shop_app/enum.dart';
import 'package:shop_app/models/Cutom_appbar.dart';
import 'component/body.dart';

class Home extends StatelessWidget {
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottombar(selected: MenuState.home),
    );
  }
}
