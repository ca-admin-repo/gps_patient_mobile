import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  static final AppLocalizations _singleton = AppLocalizations._internal();

  AppLocalizations._internal();

  static AppLocalizations get instance => _singleton;

  Map<dynamic, dynamic> _localisedValues = {};
  Map<dynamic, dynamic> _defaultLocalisedValues = {};

  Future<AppLocalizations> load(String languageCode) async {
    _localisedValues = await _loadJSON(languageCode);
    _defaultLocalisedValues = await _loadJSON('ta');
    return this;
  }

  Future<dynamic> _loadJSON(String code) async {
    String jsonContent =
        await rootBundle.loadString("assets/locale/localization_$code.json");
    return json.decode(jsonContent);
  }

  String translate(String key, [Map<String, dynamic>? arguments]) {
    String translation = _localisedValues[key] ??  '$key not found';
    // String translation = _localisedValues[key] ?? _defaultLocalisedValues[key] ??  '$key not found';
    if (arguments == null || arguments.length == 0) {
      return translation;
    }
    arguments.forEach((argumentKey, value) {
      translation = translation.replaceAll("{{$argumentKey}}", '$value');
    });
    return translation;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ta'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.instance.load(locale.languageCode);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => true;
}

String i18(String key, [Map<String, dynamic>? arguments]) {
  return AppLocalizations.instance.translate(key, arguments);
}
