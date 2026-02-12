import 'package:flutter/material.dart';
import 'package:tuts/l10n/app_localizations.dart';
import 'package:tuts/l10n/app_localizations_en.dart';

extension ContextExtensions on BuildContext {
  /// Returns the theme of the app.
  ThemeData get theme => Theme.of(this);

  /// Returns the text theme of the app.
  TextTheme get textTheme => .of(this);

  /// Returns the color scheme of the app.
  ColorScheme get colorScheme => .of(this);

  /// Returns the brightness of the app.
  Brightness get brightness => Theme.of(this).brightness;

  /// Returns true if the app is in dark mode.
  bool get isDark => brightness == .dark;

  /// Returns the current locale of the app.
  ///
  /// Falls back to English if the locale is not found.
  AppLocalizations get l10n => .of(this) ?? AppLocalizationsEn();
}
