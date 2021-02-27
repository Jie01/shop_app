import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

const kprimaryc = Color(0xffff7643);
const kprimarylightc = Color(0xffffecdf);
const kprimaryGradc = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xffffecdf)]);

const kSecondc = Color(0xff979797);
const ktextc = Color(0xff757575);

const kAnimationDura = Duration(milliseconds: 200);

String myName = '';
String gmail = '';
double money = 0;

TextStyle kheading = TextStyle(
  color: Colors.black,
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
);
TextStyle kmedium = TextStyle(
  color: Colors.black,
  fontSize: 13,
);

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String eEmailNullError = "Please Enter your email";
const String eInvalidEmailError = "Please Enter Valid Email";
const String pPassNullError = "Please Enter your password";
const String pShortPassError = "Password is too short";
const String pMatchPassError = "Passwords don't match";
const String cNamelNullError = "Please Enter your name";
const String cPhoneNumberNullError = "Please Enter your phone number";
const String cAddressNullError = "Please Enter your address";

final otpInputD = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  enabledBorder: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  border: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: ktextc),
    borderRadius: BorderRadius.circular(15),
  );
}

const apiKey =
    'pk_live_51ILW1iAP9i7iJAs4IS6S9zM7TtGxpm7xTVi1eHy90bd2iqdolEBEuSY8njTptDEpJHww2wzqgcBhaGrfs3YjTgaa00ngzOPY3E';
const secretKey =
    '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';
const nikesPriceId = 'price_1IM9KkAP9i7iJAs4Y2GUxGsP';

const secretKey2 =
    "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";
