import 'package:flutter/material.dart';

class LocaleNotifier with ChangeNotifier {
  static final LocaleNotifier _singleton = LocaleNotifier._internal();

  LocaleNotifier._internal();

  Locale locale = const Locale('en');
  Locale get getlocale => locale;

  factory LocaleNotifier() {
    return _singleton;
  }
  changeLocale(Locale l) {
    locale = l;
    notifyListeners();
  }
}
