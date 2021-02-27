import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help Center"),
      ),
      body: Center(
        child: Text(
            " message, \n you may need to change your setting to 24 hour format,\n otherwise it may mess up am and pm"),
      ),
    );
  }
}
