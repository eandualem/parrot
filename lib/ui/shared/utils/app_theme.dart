import 'package:flutter/material.dart';
import 'package:parrot/ui/shared/utils/dark_theme.dart';
import 'package:parrot/ui/shared/utils/light_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppThemes {
  lightTheme,
  darkTheme
}

class ThemeChanger with ChangeNotifier {
  final String _key = "theme";
  ThemeData _themeData;
  SharedPreferences _prefs;

  ThemeChanger() {
    _loadFromPrefs();
  }

  final _appThemeData = {
    AppThemes.lightTheme: lightTheme(),
    AppThemes.darkTheme: darkTheme()
  };
  
  ThemeData get themeData => _themeData;

  void setTheme(AppThemes theme) {
    _themeData = _appThemeData[theme];
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if(_prefs == null)
      _prefs = await SharedPreferences.getInstance();
  }
  
  _saveToPrefs() async {
    await _initPrefs();
    int _saveIndex = _appThemeData.keys.firstWhere((i) => _appThemeData[i] == _themeData).index;
    _prefs.setInt(_key, _saveIndex);
  }

  _loadFromPrefs() async {
    await _initPrefs();
    int _saveIndex = _prefs.getInt(_key);
    _themeData = _appThemeData.values.firstWhere((i) => _appThemeData[i] == _appThemeData[_saveIndex]);
    notifyListeners();
  }

}
