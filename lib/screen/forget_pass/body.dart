import 'package:flutter/material.dart';
import 'package:shop_app/components/FormError.dart';
import 'package:shop_app/components/dbtn_likeBtn.dart';
import 'package:shop_app/components/noacc.dart';
import 'package:shop_app/screen/sign_in/components/sign_form.dart';

import '../../constants.dart';
import '../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
              ),
              Text(
                "Forgot Password",
                style: kheading,
              ),
              Text(
                "Enter your email and we will send \na link to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
              ),
              Forgot_form(),
            ],
          ),
        ),
      ),
    );
  }
}

class Forgot_form extends StatefulWidget {
  @override
  _Forgot_formState createState() => _Forgot_formState();
}

class _Forgot_formState extends State<Forgot_form> {
  List<String> errors = [];

  final _formkey = GlobalKey<FormState>();

  String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Form(
          key: _formkey,
          child: TextFormField(
            onSaved: (v) => email = v,
            onChanged: (v) {
              if (v.isNotEmpty && errors.contains(eEmailNullError)) {
                setState(() {
                  errors.remove(eEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(v) &&
                  errors.contains(eInvalidEmailError)) {
                setState(() {
                  errors.remove(eInvalidEmailError);
                });
              }
            },
            validator: (v) {
              if (v.isEmpty && !errors.contains(eEmailNullError)) {
                setState(() {
                  errors.add(eEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(v) &&
                  !errors.contains(eInvalidEmailError)) {
                setState(() {
                  errors.add(eInvalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your Email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: sicon(
                Icons: Icons.email,
              ),
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(30),
        ),
        FormError(
          errors: errors,
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.1,
        ),
        DBtn(
          text: "Send",
          pressed: () {
            if (_formkey.currentState.validate() == null) {
              _formkey.currentState.save();
            }
          },
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.1,
        ),
        NoAcc(),
      ],
    );
  }
}
