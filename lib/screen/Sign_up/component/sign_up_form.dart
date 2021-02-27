import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/FormError.dart';
import 'package:shop_app/components/dbtn_likeBtn.dart';
import 'package:shop_app/screen/complete_profile/com_pro.dart';
import 'package:shop_app/services/auth.dart';
import 'package:shop_app/services/database.dart';
import 'package:shop_app/services/helper.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  AuthMethod authMethod = AuthMethod();
  HelperFunc helperFunc = HelperFunc();

  String cfpassword;

  final List<String> errors = [];

  signMeUp() {
    if (_formkey.currentState.validate()) {
      authMethod
          .signUpwithEmailPass(emailController.text, passController.text)
          .then((value) {
        if (value != null) {
          gmail = emailController.text;

          HelperFunc.saveuserloggedIn(true);
          HelperFunc.saveuseremail(emailController.text);

          Navigator.pushNamed(context, CompletePro.routeName);

          if (errors.contains("this email is used")) {
            setState(() {
              errors.removeWhere((element) => element == "this email is used");
            });
          }
        } else {
          setState(() {
            errors.add("this email is used");
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          ebuildForm(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          pbuildForm(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          CFpbuildForm(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          DBtn(
            text: "Continue",
            pressed: () {
              signMeUp();
            },
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.07,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SocialCard(
                icon: "assets/icons/google-icon.svg",
              ),
              SocialCard(
                icon: "assets/icons/facebook-2.svg",
              ),
              SocialCard(
                icon: "assets/icons/twitter.svg",
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Text(
            "By continuing your confirm that you agree \nwith our Term and Condition",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  TextFormField ebuildForm() {
    return TextFormField(
      controller: emailController,
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
          return "";
        } else if (!emailValidatorRegExp.hasMatch(v) &&
            !errors.contains(eInvalidEmailError)) {
          setState(() {
            errors.add(eInvalidEmailError);
          });
          return "";
        } else if (v.isEmpty) {
          return "";
        } else if (!emailValidatorRegExp.hasMatch(v)) {
          return "";
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
    );
  }

  TextFormField pbuildForm() {
    return TextFormField(
      controller: passController,
      obscureText: true,
      onChanged: (v) {
        if (v.isNotEmpty && errors.contains(pPassNullError)) {
          setState(() {
            errors.remove(pPassNullError);
          });
        } else if (v.length >= 8 && errors.contains(pShortPassError)) {
          setState(() {
            errors.remove(pShortPassError);
          });
        }
        return null;
      },
      validator: (v) {
        if (v.isEmpty && !errors.contains(pPassNullError)) {
          setState(() {
            errors.add(pPassNullError);
          });
          return "";
        } else if (v.length < 8 && !errors.contains(pShortPassError)) {
          setState(() {
            errors.add(pShortPassError);
          });
          return "";
        } else if (v.isEmpty) {
          return "";
        } else if (v.length < 8) {
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: sicon(
          Icons: Icons.lock_outline,
        ),
      ),
    );
  }

  TextFormField CFpbuildForm() {
    return TextFormField(
      obscureText: true,
      onSaved: (v) => cfpassword = v,
      onChanged: (v) {
        if (passController.text == cfpassword &&
            errors.contains(pMatchPassError)) {
          setState(() {
            errors.remove(pMatchPassError);
          });
        }
        return null;
      },
      validator: (v) {
        if (v.isEmpty) {
          return "";
        } else if (passController.text != v &&
            !errors.contains(pMatchPassError)) {
          setState(() {
            errors.add(pMatchPassError);
          });
          return "";
        } else if (passController.text != v) {
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: sicon(
          Icons: Icons.lock_outline,
        ),
      ),
    );
  }
}
