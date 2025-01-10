
import 'package:flutter/material.dart';
import 'package:winkle_final/Utilis/enum.dart';
import 'package:winkle_final/Utilis/shared_preferences_keys.dart';
import 'package:winkle_final/Utilis/themes.dart';


class ThemeProvider extends ChangeNotifier {
  
  ThemeProvider({required BuildContext applicationcontext})
      : _applicationcontext = applicationcontext;

  final BuildContext _applicationcontext;
  bool _isLightMode = true;
  ThemeData _themeData = AppTheme.getThemeData;
  ThemeModeType _themeModeType = ThemeModeType.system;
  FontFamilyType _fontType = FontFamilyType.WorkSans;
  ColorType _colorType = ColorType.Verdigris;
  LanguageType _languageType = LanguageType.en;

  ThemeData get themeData => _themeData;
  bool get isLightMode => _isLightMode;
  ThemeModeType get themeModeType => _themeModeType;
  FontFamilyType get fontType => _fontType;
  ColorType get colorType => _colorType;
  LanguageType get languageType => _languageType;

  Future<void> updateThemeMode(ThemeModeType themeModeType) async {
    await SharedPreferencesKeys(_applicationcontext)
        .setThemeMode(themeModeType);

    final systemBrightness =
        MediaQuery.of(_applicationcontext).platformBrightness;
    checkAndSetThemeMode(themeModeType == ThemeModeType.light
        ? Brightness.light
        : themeModeType == ThemeModeType.dark
            ? Brightness.dark
            : systemBrightness);
  }

  void checkAndSetThemeMode(Brightness systemBrightness) async {
    bool theLightTheme = _isLightMode;

    _themeModeType = await SharedPreferencesKeys(_applicationcontext)
        .getThemeMode();

    if (_themeModeType == ThemeModeType.system) {
      theLightTheme = systemBrightness == Brightness.light;
    } else if (_themeModeType == ThemeModeType.dark) {
      theLightTheme = false;
    } else {
      theLightTheme = true;
    }

    if (_isLightMode != theLightTheme) {
      _isLightMode = theLightTheme;
      _themeData = AppTheme.getThemeData;
      notifyListeners();
    }
  }

  Future<void> checkAndSetFonType() async {
    final FontFamilyType fontType =
        await SharedPreferencesKeys(_applicationcontext).getFontType();
    if (fontType != _fontType) {
      _fontType = fontType;
      _themeData = AppTheme.getThemeData;
      notifyListeners();
    }
  }

  Future<void> updateFontType(FontFamilyType fontType) async {
    await SharedPreferencesKeys(_applicationcontext)
        .setFontType(fontType);
    _fontType = fontType;
    _themeData = AppTheme.getThemeData;
    notifyListeners();
  }

  Future<void> updateColorType(ColorType colorType) async {
    await SharedPreferencesKeys(_applicationcontext)
        .setColorType(colorType);
    _colorType = colorType;
    _themeData = AppTheme.getThemeData;
    notifyListeners();
  }

  Future<void> checkAndSetColorType() async {
    final ColorType colorType =
        await SharedPreferencesKeys(_applicationcontext).getColorType();
    if (colorType != _colorType) {
      _colorType = colorType;
      _themeData = AppTheme.getThemeData;
      notifyListeners();
    }
  }

  Future<void> updateLanguage(LanguageType languageType) async {
    await SharedPreferencesKeys(_applicationcontext)
        .setLanguageType(languageType);
    _languageType = languageType;
    _themeData = AppTheme.getThemeData;
    notifyListeners();
  }

  Future<void> checkAndSetLanguage() async {
    final LanguageType languageType =
        await SharedPreferencesKeys(_applicationcontext).getLanguageType();
    if (languageType != _languageType) {
      _languageType = languageType;
      _themeData = AppTheme.getThemeData;
      notifyListeners();
    }
  }
}