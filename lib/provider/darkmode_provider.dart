import 'package:flutter/material.dart';

class ThemeModeProvider with ChangeNotifier {
  bool isdark = false;
  switchmode() {
    isdark = !isdark;
    print(isdark);
    notifyListeners();
  }
}
