import 'package:flutter/material.dart';
import 'package:shop_app/components/iconbtn.dart';
import 'package:shop_app/enum.dart';
import 'package:shop_app/models/Cutom_appbar.dart';
import 'package:shop_app/screen/message/components/search.dart';

import 'components/body.dart';

class Message extends StatelessWidget {
  static String routeName = '/message';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: Container(),
        title: Text("Message"),
        actions: [
          IconBtn(
              icon: Icons.search,
              press: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Search()));
              }),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Body(),
      ),
      bottomNavigationBar: CustomBottombar(
        selected: MenuState.message,
      ),
    );
  }
}
