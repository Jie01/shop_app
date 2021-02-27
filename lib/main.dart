import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/routs.dart';
import 'package:shop_app/screen/logined/logined.dart';
import 'package:shop_app/screen/profile/profile.dart';
import 'package:shop_app/screen/splash/splash_screen.dart';
import 'package:shop_app/services/helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userLogin = false;

  @override
  void initState() {
    getLogInState();
    super.initState();
  }

  getLogInState() async {
    await HelperFunc.getLogIn().then((value) {
      setState(() {
        if (value != null) {
          userLogin = value;
        }
      });
    });
    myName = await HelperFunc.getusername();
    gmail = await HelperFunc.getuseremail();
    setState(() {});
    print("$gmail is gmail $myName is name");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: userLogin ? LoginedIn() : SplashScreen(),
      // initialRoute:  LoginedIn.routeName : SplashScreen.routeName,
      routes: routes,
    );
  }
}

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.blue,
    fontFamily: "Muli",
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: TextTheme(
            headline6: TextStyle(
          color: Color(0xff8b8b8b),
          fontSize: 18,
        ))),
    inputDecorationTheme: inputtheme(),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: ktextc),
      bodyText2: TextStyle(color: ktextc),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputtheme() {
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: ktextc),
      gapPadding: 5,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: ktextc),
      gapPadding: 5,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.red),
      gapPadding: 5,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.red),
      gapPadding: 5,
    ),
  );
}
