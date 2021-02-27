import 'package:flutter/material.dart';
import 'package:shop_app/screen/Sign_up/component/sign_up_form.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

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
                height: 20,
              ),
              Text(
                "Register Account",
                style: kheading,
              ),
              Text(
                "Complete your detail or continue \nwith social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
