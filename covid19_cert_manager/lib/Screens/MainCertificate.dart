import 'package:covid19_cert_manager/Components/BasicScaffold.dart';
import 'package:covid19_cert_manager/Components/MenuNavigator.dart';
import 'package:covid19_cert_manager/Kernel/CertificatesWorker.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenMainCertificate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScreenMainCertificateState();
}

class ScreenMainCertificateState extends State<ScreenMainCertificate> {
  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      title: 'screens.main.title',
      drawer: MenuNavigator.getDrawer(context),
      body: CertificatesWorker.displayDefaultCertificate(),
    );
  }
}