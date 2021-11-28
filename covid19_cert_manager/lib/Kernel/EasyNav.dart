import 'package:flutter/cupertino.dart';

class EasyNav {
  static void navigate({required String path, required BuildContext context, bool enableBack = false}) {
    if(!enableBack) Navigator.pop(context);
    Navigator.pushNamed(context, path);
  }
}