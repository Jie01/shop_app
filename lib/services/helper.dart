import 'package:shared_preferences/shared_preferences.dart';

class HelperFunc {
  static String LogginKey = "ISLOGGEDIN";
  static String UsernameKey = "USERNAMEKEY";
  static String UserEmailKey = "USEREMAILKEY";

  //see if there are success

  static Future<bool> saveuserloggedIn(bool isloggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(LogginKey, isloggedIn);
  }

  static Future<bool> saveusername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(UsernameKey, username);
  }

  static Future<bool> saveuseremail(String useremail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(UserEmailKey, useremail);
  }

  //take data

  static Future<bool> getLogIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(LogginKey);
  }

  static Future<String> getusername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(UsernameKey);
  }

  static Future<String> getuseremail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(UserEmailKey);
  }
}
