import 'package:flutter/cupertino.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class splashContent extends StatelessWidget {
  const splashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          "SSDC Charity sale",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(36),
              color: kprimaryc,
              fontWeight: FontWeight.bold),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: getProportionateScreenHeight(300),
        ),
      ],
    );
  }
}
