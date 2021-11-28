// Used to edit and add certificates conditionally

import 'package:covid19_cert_manager/Components/BasicScaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenCertificateEditor extends StatefulWidget {
  late bool isEditing;

  ScreenCertificateEditor(bool isEditing) {
    this.isEditing = isEditing;
  }

  @override
  State<StatefulWidget> createState() => ScreenCertificateEditorState(isEditing);
}

class ScreenCertificateEditorState extends State<ScreenCertificateEditor> {
  late bool isEditing;

  ScreenCertificateEditorState(bool isEditing) {
    this.isEditing = isEditing;
  }

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      body: Column(
        children: [

        ],
      ),
      title: 'screens.certificate_editor.title',
      actionBtn: FloatingActionButton(
        onPressed: () async {
          
        },
        child: Icon(Icons.qr_code),
      ),
    );
  }
}