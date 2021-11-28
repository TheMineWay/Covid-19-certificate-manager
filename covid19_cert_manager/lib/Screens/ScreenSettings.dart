import 'package:covid19_cert_manager/Kernel/auth_manager.dart';
import 'package:covid19_cert_manager/Kernel/config.dart';
import 'package:dynamic_themes/dynamic_themes.dart';
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

  late bool darkModeEnabled;
  late bool authRequired;

  Widget body() {
    if(isLoading) return Center(child: CircularProgressIndicator(),);

    return ListView(
      children: [
        SwitchListTile(
          title: Text("screens.settings.options.require_auth".tr()),
          secondary: Icon(Icons.lock),
          onChanged: (bool value) async {
            bool authorised = await AuthManager.isAuthorised(force: true);
            if(!authorised) return;
            appConf.setBiometricProtection(value);

            authRequired = value;
            setState(() => {});
          },
          value: authRequired,
        ),
        SwitchListTile(
          title: Text("screens.settings.options.dark_mode".tr()),
          secondary: Icon(Icons.dark_mode),
          onChanged: (bool value) async {
            appConf.setDarkMode(value);
            darkModeEnabled = value;

            // Change theme
            await DynamicTheme.of(context)!.setTheme(value ? 1 : 0);

            setState(() => {});
          },
          value: darkModeEnabled,
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
    darkModeEnabled = appConf.enabledDarkMode();

    isLoading = false;
    setState(() => {});
  }
}