import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/photo.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screen/profile/components/Account.dart';
import 'package:shop_app/screen/splash/splash_screen.dart';
import 'package:shop_app/services/auth.dart';
import 'package:shop_app/services/helper.dart';

import 'components/help_center.dart';

class Body extends StatelessWidget {
  AuthMethod authMethod = AuthMethod();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Photo(),
        SizedBox(
          height: 20,
        ),
        ProMenu(
          icon: Icons.person_outline,
          text: "My Account",
          press: () {
            Navigator.pushNamed(context, Account.routeName);
          },
        ),
        ProMenu(
          icon: Icons.notifications_none,
          text: "Notifications",
          press: () {},
        ),
        ProMenu(
          icon: Icons.settings,
          text: "Setting",
          press: () {},
        ),
        ProMenu(
          icon: Icons.help_outline,
          text: "Help Center",
          press: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Help()));
          },
        ),
        ProMenu(
          icon: Icons.exit_to_app,
          text: "Log Out",
          press: () {
            authMethod.SignOut();
            HelperFunc.saveuserloggedIn(false);
            Navigator.pushReplacementNamed(context, SplashScreen.routeName);
          },
        ),
      ],
    );
  }
}

class ProMenu extends StatelessWidget {
  const ProMenu({
    Key key,
    this.text,
    this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xfff5f6f9),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: kprimaryc,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
