import 'package:erpnext_viewer/utils/utilities.dart';
import 'package:hive/hive.dart';

class HiveGeneralData {
  static Box<dynamic>? hive;

  static const String spURL = 'url';
  static const String spEMAIL = 'email';
  static const String spPASSWORD = 'password';
  static const String spREMEMBERME = 'remember_me';

  static String getUrl() {
    var result = Utilities.getUserSp(spURL);
    if (result != null) {
      return result;
    } else {
      return '';
    }
  }

  static void setUrl(String value) async {
    Utilities.setUserSp(spURL, value);
  }

  static String getEmail() {
    var result = Utilities.getUserSp(spEMAIL);
    if (result != null) {
      return result;
    } else {
      return '';
    }
  }

  static void setEmail(String value) async {
    Utilities.setUserSp(spEMAIL, value);
  }

  static String getPassword() {
    var result = Utilities.getUserSp(spPASSWORD);
    if (result != null) {
      return result;
    } else {
      return '';
    }
  }

  static void setPassword(String value) async {
    Utilities.setUserSp(spPASSWORD, value);
  }

  static bool getRememberMe() {
    var result = Utilities.getUserSp(spREMEMBERME);
    if (result != null) {
      return result;
    } else {
      return true;
    }
  }

  static void setRememberMe(bool value) async {
    Utilities.setUserSp(spREMEMBERME, value);
  }
}
