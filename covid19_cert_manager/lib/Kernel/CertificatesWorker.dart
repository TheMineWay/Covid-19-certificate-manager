import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CertificatesWorker {
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

  static Widget displayCertificate(String? id) {
    if(id == null) {
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
                onPressed: () {},
              ),
            )
          ],
        ),
      );
    }
    else {
      return Text("Certificado");
    }
  }

  static Widget displayDefaultCertificate() {
    return displayCertificate(defaultCertificate());
  }

  // Backstage

  static List<String> certificates() {
    return [];
  }

  static String? defaultCertificate() {
    return null;
  }
}