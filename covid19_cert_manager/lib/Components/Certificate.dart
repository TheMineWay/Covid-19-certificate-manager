import 'package:flutter/cupertino.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Certificate extends StatelessWidget {
  Certificate({required this.qrCode, required this.name});

  String name;
  String qrCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QrImage(data: qrCode, backgroundColor: Color.fromARGB(255, 255, 255, 255)),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            name,
            style: TextStyle(fontSize: 25),
          ),
        )
      ],
    );
  }
}
