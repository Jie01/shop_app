import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/screen/Favourite/like.dart';
import 'package:shop_app/screen/home/home.dart';
import 'package:shop_app/screen/message/message.dart';
import 'package:shop_app/screen/profile/profile.dart';

import '../constants.dart';
import '../enum.dart';

class CustomBottombar extends StatelessWidget {
  const CustomBottombar({
    Key key,
    @required this.selected,
  }) : super(key: key);

  final MenuState selected;

  @override
  Widget build(BuildContext context) {
    final Color inActivecolor = Color(0xffb6b6b6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xffdadada).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Shop Icon.svg",
                color: MenuState.home == selected ? kprimaryc : inActivecolor,
              ),
              onPressed: () => Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => Home(),
                      transitionDuration: Duration(seconds: 0))),
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Heart Icon.svg",
                color:
                    MenuState.favourite == selected ? kprimaryc : inActivecolor,
              ),
              onPressed: () => Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => Like(),
                      transitionDuration: Duration(seconds: 0))),
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Chat bubble Icon.svg",
                color:
                    MenuState.message == selected ? kprimaryc : inActivecolor,
              ),
              onPressed: () => Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => Message(),
                      transitionDuration: Duration(seconds: 0))),
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/User Icon.svg",
                color:
                    MenuState.profile == selected ? kprimaryc : inActivecolor,
              ),
              onPressed: () => Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => Profile(),
                      transitionDuration: Duration(seconds: 0))),
            ),
          ],
        ),
      ),
    );
  }
}
