import 'package:covid19_cert_manager/Kernel/EasyNav.dart';
import 'package:flutter/material.dart';

class MenuNavigator {
  static ListView getList(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('drawer.options.certificates'),
          leading: Icon(Icons.list),
          onTap: () => {
            EasyNav.navigate(path: '/certificates_list', context: context, enableBack: false)
          },
        ),
        ListTile(
          title: Text('drawer.options.settings'),
          leading: Icon(Icons.settings),
          onTap: () => {
            EasyNav.navigate(path: '/settings', context: context, enableBack: true)
          },
        ),
      ],
    );
  }

  static Drawer getDrawer(BuildContext context) {
    return Drawer(
      child: getList(context),
    );
  }
}