import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicScaffold extends StatefulWidget {
  BasicScaffold({required this.body, required this.title, this.drawer, this.actionBtn}) {}

  Widget body;
  String title;
  Drawer? drawer;
  FloatingActionButton? actionBtn;

  @override
  State<StatefulWidget> createState() => BasicScaffoldState(body: body, title: title, drawer: drawer, actionBtn: actionBtn);
}

class BasicScaffoldState extends State<BasicScaffold> {
  BasicScaffoldState({required this.body, required this.title, this.drawer, this.actionBtn}) {}
  Widget body;
  String title;
  Drawer? drawer;
  FloatingActionButton? actionBtn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title.tr()),
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: body,
        ),
      drawer: drawer,
      floatingActionButton: actionBtn,
    );
  }
}