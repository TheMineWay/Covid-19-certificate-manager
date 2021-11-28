import 'package:covid19_cert_manager/Kernel/auth_manager.dart';
import 'package:covid19_cert_manager/Kernel/config.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenSettings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScreenSettingsState();
}

class ScreenSettingsState extends State<ScreenSettings> {

  late AppConfig appConf;
  bool isLoading = true;

  late bool authRequired;

  Widget body() {
    if(isLoading) return Center(child: CircularProgressIndicator(),);

    return ListView(
      children: [
        SwitchListTile(
          title: Text("screens.settings.options.require_auth".tr()),
          onChanged: (bool value) async {
            bool authorised = await AuthManager.isAuthorised(force: true);
            if(!authorised) return;
            appConf.setBiometricProtection(value);

            authRequired = value;
            setState(() => {});
          },
          value: authRequired,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("screens.settings.title".tr()),
      ),
      body: body(),
    );
  }

  void initState() {
    load();
  }

  Future<void> load() async {
    appConf = await AppConfig.getInstance();
    authRequired = appConf.hasBiometricProtection();

    isLoading = false;
    setState(() => {});
  }
}