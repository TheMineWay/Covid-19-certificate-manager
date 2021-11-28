import 'package:covid19_cert_manager/Components/BasicScaffold.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      body: Column(
        children: [
          Text("screens.info.content.p1".tr())
        ],
      ),
      title: 'screens.info.title'
    );
  }
}