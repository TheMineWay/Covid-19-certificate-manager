import 'package:covid19_cert_manager/Kernel/config.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:local_auth/local_auth.dart';

class AuthManager {
  static LocalAuthentication localAuthentication = LocalAuthentication();

  static Future<bool> isAuthorised({bool force = false}) async {
    if(!(await AppConfig.getInstance()).hasBiometricProtection() && !force) return true;

    bool authorised = await localAuthentication.authenticate(localizedReason: "auth.reason".tr());

    return authorised;
  }
}