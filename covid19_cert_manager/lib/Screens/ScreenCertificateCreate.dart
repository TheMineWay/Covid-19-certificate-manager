// Used to edit and add certificates conditionally

import 'package:covid19_cert_manager/Components/BasicScaffold.dart';
import 'package:covid19_cert_manager/Screens/ScreenCertificateEdit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScreenCertificateCreate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScreenCertificateCreateState();
}

class ScreenCertificateCreateState extends State<ScreenCertificateCreate> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    controller!.pauseCamera();
  }

  @override
  Widget build(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(borderRadius: 15),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.stopCamera();
      result = scanData;
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => ScreenCertificateEdit(code: scanData.code)));
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}