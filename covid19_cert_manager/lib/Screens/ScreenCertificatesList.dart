import 'package:covid19_cert_manager/Components/MenuNavigator.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenCertificatesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScreenCertificatesListState();
}

class ScreenCertificatesListState extends State<ScreenCertificatesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screens.certificates_list.title'.tr()),
      ),
      drawer: MenuNavigator.getDrawer(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_outlined),
        onPressed: () => {},
      ),
    );
  }
}