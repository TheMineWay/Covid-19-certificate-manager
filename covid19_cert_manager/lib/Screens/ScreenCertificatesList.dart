import 'package:covid19_cert_manager/Components/BasicScaffold.dart';
import 'package:covid19_cert_manager/Kernel/CertificatesWorker.dart';
import 'package:covid19_cert_manager/Kernel/EasyNav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenCertificatesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScreenCertificatesListState();
}

class ScreenCertificatesListState extends State<ScreenCertificatesList> {
  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      body: CertificatesWorker.displayList(context),
      title: 'screens.certificates_list.title',
      actionBtn: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          EasyNav.navigate(path: '/certificate_create', context: context, enableBack: true);
        },
      ),
    );
  }
}