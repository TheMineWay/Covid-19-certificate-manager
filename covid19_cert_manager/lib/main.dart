import 'package:covid19_cert_manager/Kernel/config.dart';
import 'package:covid19_cert_manager/Screens/MainLoading.dart';
import 'package:covid19_cert_manager/Screens/ScreenAuth.dart';
import 'package:covid19_cert_manager/Screens/ScreenCertificatesList.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'Screens/ScreenSettings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      child: const MyApp(),
      supportedLocales: [
        Locale('en')
      ],
      fallbackLocale: Locale('en'),
      saveLocale: true,
      path: 'assets/translations'
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      title: 'Covid-19 certificate manager',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ScreenMainLoading(),
        '/auth': (context) => ScreenAuth(),
        '/certificates_list': (context) => ScreenCertificatesList(),
        '/settings': (context) => ScreenSettings(),
      },
    );
  }
}