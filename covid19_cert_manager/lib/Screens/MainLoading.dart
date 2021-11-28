import 'package:covid19_cert_manager/Components/BasicScaffold.dart';
import 'package:covid19_cert_manager/Kernel/EasyNav.dart';
import 'package:covid19_cert_manager/Kernel/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ScreenMainLoading extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScreenMainLoadingState();
}

class ScreenMainLoadingState extends State<ScreenMainLoading> {
  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      title: 'app_generics.title',
        body: Center(
          child: CircularProgressIndicator(),
        )
    );
  }

  void initState() {
    load();
  }

  Future<void> load() async {
    // Load app basics

    // App config
    await AppConfig.getInstance();

    // Change screen
    if(AppConfig.config!.hasBiometricProtection()) {
      // Needs to authenticate
      EasyNav.navigate(path: '/auth', context: context);
    } else {
      // No need of authentication
      EasyNav.navigate(path: '/main', context: context);
    }
  }
}