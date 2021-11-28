import 'package:covid19_cert_manager/Components/BasicScaffold.dart';
import 'package:covid19_cert_manager/Kernel/EasyNav.dart';
import 'package:covid19_cert_manager/Kernel/auth_manager.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenAuth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScreenAuthState();
}

class ScreenAuthState extends State<ScreenAuth> {
  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      title: 'app_generics.title',
      body: Center(
        child: Column(
          children: [
            Spacer(),
            SizedBox(
              child: ElevatedButton.icon(
                  onPressed: () => {auth()},
                  icon: Icon(
                    Icons.lock_open,
                  ),
                  label: Text('auth.authenticate'.tr())
              ),
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  void initState() {
    auth();
  }

  Future<void> auth() async {
    if(await AuthManager.isAuthorised()) {
      EasyNav.navigate(path: '/main', context: context);
    }
  }
}