import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicScaffold extends StatefulWidget {
  BasicScaffold({required this.body}) {}

  Widget body;

  @override
  State<StatefulWidget> createState() => BasicScaffoldState(body: body);
}

class BasicScaffoldState extends State<BasicScaffold> {
  BasicScaffoldState({required this.body}) {}
  Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('app_generics.title'.tr()),
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: body,
        )
    );
  }
}