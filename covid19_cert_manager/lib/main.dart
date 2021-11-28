import 'package:covid19_cert_manager/Kernel/config.dart';
import 'package:covid19_cert_manager/Screens/MainCertificate.dart';
import 'package:covid19_cert_manager/Screens/MainLoading.dart';
import 'package:covid19_cert_manager/Screens/ScreenAuth.dart';
import 'package:covid19_cert_manager/Screens/ScreenCertificatesList.dart';
import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'Screens/ScreenSettings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      child: MyApp(),
      supportedLocales: [
        Locale('en')
      ],
      fallbackLocale: Locale('en'),
      saveLocale: true,
      path: 'assets/translations'
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultThemeId: 0,
      builder: (context, theme) {
        return MaterialApp(
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          title: 'Covid-19 certificate manager',
          initialRoute: '/',
          theme: theme,
          routes: {
            '/': (context) => ScreenMainLoading(),
            '/auth': (context) => ScreenAuth(),
            '/certificates_list': (context) => ScreenCertificatesList(),
            '/settings': (context) => ScreenSettings(),
            '/main': (context) => ScreenMainCertificate(),
          },
        );
      },
      themeCollection: themeCollection
    );
  }

  ThemeCollection themeCollection = ThemeCollection(
    themes: {
      0: ThemeData(primarySwatch: Colors.indigo, brightness: Brightness.light),
      1: ThemeData(primarySwatch: Colors.indigo, brightness: Brightness.dark),
    }
  );
}