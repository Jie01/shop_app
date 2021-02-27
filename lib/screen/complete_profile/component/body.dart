import 'package:flutter/material.dart';
import 'package:shop_app/components/FormError.dart';
import 'package:shop_app/components/dbtn_likeBtn.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'comp_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.03,
              ),
              Text(
                "Complete Profile",
                style: kheading,
              ),
              Text(
                "Complete your detail or continue \nwith social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.06,
              ),
              ComplForm(),
            ],
          ),
        ),
      ),
    );
  }
}
