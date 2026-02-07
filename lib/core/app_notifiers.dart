import 'package:flutter/material.dart';

class AppValues {
  const AppValues({required this.locale, required this.brightness});

  final Locale locale;
  final Brightness brightness;

  AppValues copyWith({Locale? locale, Brightness? brightness}) {
    return AppValues(
      locale: locale ?? this.locale,
      brightness: brightness ?? this.brightness,
    );
  }
}

class AppNotifiers {
  static final appNotifier = ValueNotifier(
    AppValues(locale: const Locale('ar'), brightness: Brightness.dark),
  );

  static Locale toggleLocale() {
    appNotifier.value = appNotifier.value.copyWith(
      locale: appNotifier.value.locale.languageCode == 'en'
          ? const Locale('ar')
          : const Locale('en'),
    );
    return appNotifier.value.locale;
  }

  static Brightness toggleTheme() {
    appNotifier.value = appNotifier.value.copyWith(
      brightness: appNotifier.value.brightness == .light ? .dark : .light,
    );
    return appNotifier.value.brightness;
  }
}
