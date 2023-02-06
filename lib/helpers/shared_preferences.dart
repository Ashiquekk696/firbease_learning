import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  setLoginData({token, loggedIn}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", token);
    preferences.setBool("loggedIn", loggedIn);
  }

  getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("object ${preferences.getString("token")}");
    return preferences.getString("token");
  }

  getIsLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool("loggedIn");
  }
}
