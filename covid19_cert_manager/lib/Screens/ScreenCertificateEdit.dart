import 'package:covid19_cert_manager/Components/BasicScaffold.dart';
import 'package:covid19_cert_manager/Kernel/CertificatesWorker.dart';
import 'package:covid19_cert_manager/Kernel/EasyNav.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScreenCertificateEdit extends StatefulWidget {
  ScreenCertificateEdit({this.code});

  String? code;

  @override
  State<StatefulWidget> createState() => ScreenCertificateEditState(code: code);
}

class ScreenCertificateEditState extends State<ScreenCertificateEdit> {
  ScreenCertificateEditState({this.code});

  String? code;

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              child: QrImage(
                data: code ?? "",
              ),
              width: MediaQuery.of(context).size.width * 0.75,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "screens.certificate_editor.fields.name".tr()
              ),
              controller: nameController,
            ),
            Spacer(),
            SizedBox(
              child: ElevatedButton(
                  onPressed: () {
                    bool saved = CertificatesWorker.save(code ?? "", nameController.value.text ?? "");
                    if(saved) {
                      Navigator.pop(context);
                      EasyNav.navigate(context: context, path: '/main');
                    }
                  },
                  child: Text("sreens.certificate_editor.fields.save".tr())
              ),
              width: double.infinity,
            )
          ],
        ),
      ),
      title: 'screens.certificate_editor.title'
    );
  }
}