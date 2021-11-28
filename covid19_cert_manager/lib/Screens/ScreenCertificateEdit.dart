import 'package:covid19_cert_manager/Components/BasicScaffold.dart';
import 'package:flutter/cupertino.dart';

class ScreenCertificateEdit extends StatefulWidget {
  ScreenCertificateEdit({this.code});

  String? code;

  @override
  State<StatefulWidget> createState() => ScreenCertificateEditState(code: code);
}

class ScreenCertificateEditState extends State<ScreenCertificateEdit> {
  ScreenCertificateEditState({this.code});

  String? code;

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      body: Column(
        children: [
          Text(code ?? "nada")
        ],
      ),
      title: 'screens.certificate_editor.title'
    );
  }
}