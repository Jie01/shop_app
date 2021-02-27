import 'package:flutter/material.dart';
import 'package:shop_app/components/FormError.dart';
import 'package:shop_app/components/dbtn_likeBtn.dart';
import 'package:shop_app/screen/home/home.dart';
import 'package:shop_app/size_config.dart';

import '../../constants.dart';

class Body extends StatelessWidget {
  final String phone;

  const Body({Key key, @required this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.05,
              ),
              Text(
                "OTP Verification",
                style: kheading,
              ),
              Text(
                "We sent your code to +${phone.substring(0, 6)} *** ",
                textAlign: TextAlign.center,
              ),
              Timer(),
              Spacer(),
              OtpForm(),
              Spacer(),
              GestureDetector(
                onTap: () {
                  //resend your code
                },
                child: Text(
                  "Resend OTP Code",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Row Timer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "This code will expired in  ",
          textAlign: TextAlign.center,
        ),
        TweenAnimationBuilder(
            tween: Tween(begin: 30.0, end: 0),
            duration: Duration(seconds: 30),
            builder: (context, value, child) => Text(
                  "00:${value.toInt()}",
                  style: TextStyle(color: kprimaryc),
                ))
      ],
    );
  }
}

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _formkey = GlobalKey<FormState>();

  String otpNum;

  List<String> errors = [];

  FocusNode pin2;
  FocusNode pin3;
  FocusNode pin4;

  @override
  void initState() {
    pin2 = FocusNode();
    pin3 = FocusNode();
    pin4 = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    pin2.dispose();
    pin3.dispose();
    pin4.dispose();
    super.dispose();
  }

  void nextField({String v, FocusNode focusNode}) {
    if (v.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              otpeForm(
                onchange: (v) {
                  nextField(v: v, focusNode: pin2);
                  otpNum = v;
                  if (!v.isEmpty && errors.contains("please enter your code")) {
                    setState(() {
                      errors.remove("please enter your code");
                    });
                  }
                },
                autofocus: true,
                node: null,
              ),
              otpeForm(
                onchange: (v) {
                  nextField(v: v, focusNode: pin3);
                  otpNum = v;
                  if (!v.isEmpty && errors.contains("please enter your code")) {
                    setState(() {
                      errors.remove("please enter your code");
                    });
                  }
                },
                autofocus: true,
                node: pin2,
              ),
              otpeForm(
                onchange: (v) {
                  nextField(v: v, focusNode: pin4);
                  otpNum = v;
                  if (!v.isEmpty && errors.contains("please enter your code")) {
                    setState(() {
                      errors.remove("please enter your code");
                    });
                  }
                },
                autofocus: true,
                node: pin3,
              ),
              otpeForm(
                onchange: (v) {
                  otpNum = v;
                  pin4.unfocus();
                  if (!v.isEmpty && errors.contains("please enter your code")) {
                    setState(() {
                      errors.remove("please enter your code");
                    });
                  }
                },
                autofocus: true,
                node: pin4,
              ),
            ],
          ),
          FormError(errors: errors),
          SizedBox(
            height: SizeConfig.screenHeight * 0.15,
          ),
          DBtn(
            text: "continue",
            pressed: () {
              if (_formkey.currentState.validate()) {
                _formkey.currentState.save();
                Navigator.pushReplacementNamed(context, Home.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  SizedBox otpeForm({Function onchange, bool autofocus, FocusNode node}) {
    return SizedBox(
      width: getProportionateScreenWidth(60),
      child: TextFormField(
        focusNode: node,
        autofocus: autofocus,
        obscureText: true,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24),
        decoration: otpInputD,
        onChanged: onchange,
        validator: (v) {
          if (v.isEmpty && !errors.contains("please enter your code")) {
            setState(() {
              errors.add("please enter your code");
            });
            return "";
          } else if (v.isEmpty) {
            return "";
          }
          return null;
        },
      ),
    );
  }
}
