import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show  rootBundle;
class Translations {
  Locale locale;
  static Map<dynamic, dynamic> _localizedValues;

  Translations(Locale locale) {
    this.locale = locale;
    _localizedValues = null;
  }

  static Translations of(BuildContext context) =>
      Localizations.of<Translations>(context, Translations);

  String text(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }
  static Future<Translations> load(Locale locale) async {
    Translations translations = new Translations(locale);
  //  String jsonContent = await rootBundle.loadString('lib/international/locale/i18n_${locale.languageCode}.json');
    String jsonContent = await rootBundle.loadString("locale/i18n_${locale.languageCode}.json");

    _localizedValues = json.decode(jsonContent);
    return translations;
  }

  get currentLanguage => locale.languageCode;
}

class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  ///验证支持的语言
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);
  /// 改这里是为了不硬编码支持的语言


  @override
  bool shouldReload(LocalizationsDelegate<Translations> old) => false;



  @override
  Future<Translations> load(Locale locale) => Translations.load(locale);
}

