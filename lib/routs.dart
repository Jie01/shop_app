import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/checkout/checkout.dart';
import 'package:shop_app/screen/Favourite/like.dart';
import 'package:shop_app/screen/Sign_up/Sign_up.dart';
import 'package:shop_app/screen/cart/cart.dart';
import 'package:shop_app/screen/complete_profile/com_pro.dart';
import 'package:shop_app/screen/detail/detail.dart';
import 'package:shop_app/screen/forget_pass/forget_pass.dart';
import 'package:shop_app/screen/home/home.dart';
import 'package:shop_app/screen/logined/logined.dart';
import 'package:shop_app/screen/message/message.dart';
import 'package:shop_app/screen/otp/otp.dart';
import 'package:shop_app/screen/profile/components/Account.dart';
import 'package:shop_app/screen/profile/profile.dart';
import 'package:shop_app/screen/sign_in/sign_in_screen.dart';
import 'package:shop_app/screen/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignIn.routeName: (context) => SignIn(),
  Sign_up.routeName: (context) => Sign_up(),
  LoginedIn.routeName: (context) => LoginedIn(),
  Forget_pass.routeName: (context) => Forget_pass(),
  CompletePro.routeName: (context) => CompletePro(),
  Otp.routeName: (context) => Otp(),
  Home.routeName: (context) => Home(),
  Detail.routeName: (context) => Detail(),
  Carts.routeName: (context) => Carts(),
  Profile.routeName: (context) => Profile(),
  Like.routeName: (context) => Like(),
  Message.routeName: (context) => Message(),
  Account.routeName: (context) => Account(),
  Checkout.routeName: (context) => Checkout(),
};
