import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService extends ChangeNotifier {
  SharedPreferences? prefs;

  PreferencesService() {
    _getPreferences();
  }
  _getPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }
}
