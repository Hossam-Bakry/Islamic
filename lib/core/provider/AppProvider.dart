import 'package:flutter/material.dart';
import 'package:islamic/core/local/cashe_helper.dart';

class AppProvider extends ChangeNotifier {
  String appLanguage = 'en';

  ThemeMode appthemeMode = ThemeMode.light;

  bool isDarkMode() {
    return appthemeMode == ThemeMode.dark;
  }

  bool isDark = false;

  void changeThemeMode(ThemeMode newTheme) {
    if (newTheme == appthemeMode) {
      return;
    }
    appthemeMode = newTheme;

    if (appthemeMode == ThemeMode.dark) {
      isDark = !isDark;
    } else {
      isDark = isDark;
    }

    CasheHelper.putData(key: 'isDark', value: isDark).then((value) {
      notifyListeners();
    });
  }

  void changeLanguage(String lang) {
    if (lang == appLanguage) {
      return;
    }
    appLanguage = lang;
    notifyListeners();
  }
}
