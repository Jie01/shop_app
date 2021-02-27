import 'package:shared_preferences/shared_preferences.dart';

final String prefUser = 'username';
final String prefImage = 'image';

saveUsername(String username) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(prefUser, username);
  print("username saved");
}

saveImage(String image) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(prefImage, image);
  print("image saved");
}

getImages() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(prefImage);
}

getUsername() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(prefUser);
}
