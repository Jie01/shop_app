import 'package:flutter/material.dart';

import 'component/body.dart';

class CompletePro extends StatelessWidget {
  static String routeName = '/compl_prof';
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
