import 'dart:convert';

import 'package:covid19_cert_manager/Components/Certificate.dart';
import 'package:covid19_cert_manager/Kernel/EasyNav.dart';
import 'package:covid19_cert_manager/Kernel/config.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CertificatesWorker {
  static late AppConfig appConfig;
  static Map<String, dynamic> certificates = {};

  static void init(AppConfig ac) {
    appConfig = ac;
    String base = ac.sharedPreferences.getString("certificates") ?? "{}";
    print(base);
    certificates = jsonDecode(base);
  }

  static ListView displayList() {
    return ListView(
      children: [
        ListTile(
          title: Text("Certificado 1"),
          leading: Icon(Icons.account_circle),
        ),
      ],
    );
  }

  static Widget displayCertificate(BuildContext context, String? id) {
    if(id == null || !certificates.containsKey(id)) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.badge,
              size: 80,
            ),
            Text("screens.main.content.empty".tr()),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text("main.content.add_first_cert".tr()),
                onPressed: () {
                  EasyNav.navigate(path: '/certificate_create', context: context, enableBack: true);
                },
              ),
            )
          ],
        ),
      );
    }
    else {
      String code = certificates[id];
      return Certificate(qrCode: code, name: id);
    }
  }

  static Widget displayDefaultCertificate(BuildContext context) {
    return displayCertificate(context, defaultCertificate());
  }

  // Backstage

  static String? defaultCertificate() {
    SharedPreferences sp = appConfig.sharedPreferences;

    return sp.getString("main_certificate");
  }

  static bool save(String code, String name) {
    SharedPreferences sp = appConfig.sharedPreferences;

    if(certificates.containsKey(name)) return false;

    if(certificates.keys.length <= 0) setAsMain(name);
    certificates[name] = code;

    sp.setString("certificates", jsonEncode(certificates));

    return true;
  }

  static void setAsMain(String value) {
    SharedPreferences sp = appConfig.sharedPreferences;
    sp.setString("main_certificate", value);
  }
}