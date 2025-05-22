import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _sharedPrefs;
  static String _name = "";
  static String _password = "";

  static String get name {
    return _sharedPrefs.getString("name") ?? _name;
  }

  static String get password {
    return _sharedPrefs.getString("password") ?? _password;
  }

  static set password(String value) {
    _sharedPrefs.setString("password", value);
  }

  static set name(String value) {
    _sharedPrefs.setString("name", value);
  }

  static Future init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }
}
