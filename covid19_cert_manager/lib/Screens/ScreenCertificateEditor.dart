// Used to edit and add certificates conditionally

import 'package:covid19_cert_manager/Components/BasicScaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScreenCertificateEditor extends StatefulWidget {
  late bool isEditing;

  ScreenCertificateEditor(bool isEditing) {
    this.isEditing = isEditing;
  }

  @override
  State<StatefulWidget> createState() => ScreenCertificateEditorState(isEditing);
}

class ScreenCertificateEditorState extends State<ScreenCertificateEditor> {
  final qrKey = GlobalKey(debugLabel: 'QR Scanner');
  QRViewController? controller;

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
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return buildQrView(context);
            }
          );
        },
        child: Icon(Icons.qr_code),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Widget buildQrView(BuildContext context) => QRView(
    key: qrKey,
    onQRViewCreated: onQRViewCreated
  );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
  }
}