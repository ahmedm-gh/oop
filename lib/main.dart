import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:oop_tut/l10n/app_localizations.dart";
import "package:oop_tut/core/app_notifiers.dart";
import "package:oop_tut/features/home/home_page.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppNotifiers.appNotifier,
      builder: (context, appValues, _) {
        log("appValues.locale: ${appValues.locale}");
        log("appValues.brightness: ${appValues.brightness}");
        return MaterialApp(
          locale: appValues.locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: .fromSeed(
              seedColor: Colors.indigo,
              brightness: appValues.brightness,
            ),
            appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
            cardTheme: CardThemeData(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: .circular(16),
                side: const BorderSide(color: Colors.white10),
              ),
            ),
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
