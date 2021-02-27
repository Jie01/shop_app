import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/FormError.dart';
import 'package:shop_app/components/dbtn_likeBtn.dart';
import 'package:shop_app/screen/forget_pass/forget_pass.dart';
import 'package:shop_app/screen/logined/logined.dart';
import 'package:shop_app/services/auth.dart';
import 'package:shop_app/services/database.dart';
import 'package:shop_app/services/helper.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formkey = GlobalKey<FormState>();
  final List<String> errors = [];

  AuthMethod authMethod = AuthMethod();
  Database database = Database();

  TextEditingController emailcontrol = TextEditingController();
  TextEditingController passcontrol = TextEditingController();

  bool remember = false;

  QuerySnapshot userInfoSnapshot;

  signMeIn() {
    if (_formkey.currentState.validate()) {
      HelperFunc.saveuseremail(emailcontrol.text);

      database.getUserbyEmail(emailcontrol.text).then((v) {
        userInfoSnapshot = v;
        HelperFunc.saveusername(userInfoSnapshot.docs[0].data()["name"])
            .catchError((e) {
          print("${e.toString()} is name error");
        });
        print("${userInfoSnapshot.docs[0].data()["name"]} is saved name");
      });
      authMethod
          .signInwithEmailPass(emailcontrol.text, passcontrol.text)
          .then((value) {
        if (value != null) {
          HelperFunc.saveuserloggedIn(remember);

          Navigator.popAndPushNamed(context, LoginedIn.routeName);

          setState(() {
            gmail = emailcontrol.text;
          });

          if (errors.contains("$eInvalidEmailError / password")) {
            setState(() {
              errors.removeWhere(
                  (element) => "$eInvalidEmailError / password" == element);
            });
          }
        } else if (value == null &&
            !errors.contains("$eInvalidEmailError / password")) {
          setState(() {
            errors.add("$eInvalidEmailError / password");
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
            height: getProportionateScreenHeight(20),
          ),
          pbuildForm(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kprimaryc,
                onChanged: (v) {
                  setState(() {
                    remember = v;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Forget_pass.routeName);
                },
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          DBtn(
            text: "Continue",
            pressed: () {
              signMeIn();
            },
          ),
        ],
      ),
    );
  }

  TextFormField ebuildForm() {
    return TextFormField(
      controller: emailcontrol,
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
        } else if (v.isEmpty || !emailValidatorRegExp.hasMatch(v)) {
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
      controller: passcontrol,
      obscureText: true,
      onChanged: (v) {
        if (v.isNotEmpty && errors.contains(pPassNullError)) {
          setState(() {
            errors.remove(pPassNullError);
          });
          return "";
        } else if (v.length >= 8 && errors.contains(pShortPassError)) {
          setState(() {
            errors.remove(pShortPassError);
          });
          return "";
        }
        return '';
      },
      validator: (v) {
        if (v.isEmpty && !errors.contains(pPassNullError)) {
          setState(() {
            errors.add(pPassNullError);
          });
        } else if (v.length < 8 && !errors.contains(pShortPassError)) {
          setState(() {
            errors.add(pShortPassError);
          });
        } else if (v.isEmpty || v.length < 8) {
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
}
