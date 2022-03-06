import 'dart:async';
import 'dart:io';
import 'package:erpnext_viewer/utils/hive.dart';
import 'package:erpnext_viewer/views/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utilities {
  static Future<bool> isOnline() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  static dynamic getSetting(String id, {dynamic defaultValue}) {
    if (HiveGeneralData.hive != null) {
      return HiveGeneralData.hive!.get(id);
    } else {
      return null;
    }
  }

  static void setSetting(String id, dynamic value) async {
    if (HiveGeneralData.hive != null) {
      await HiveGeneralData.hive!.put(id, value);
    } else {
      return null;
    }
  }

  static dynamic getUserSp(String id, {dynamic defaultValue}) {
    if (HiveGeneralData.hive != null) {
      return HiveGeneralData.hive!.get(id);
    } else {
      return null;
    }
  }

  static void setUserSp(String id, dynamic value) async {
    if (HiveGeneralData.hive != null) {
      return await HiveGeneralData.hive!.put(id, value);
    } else {
      return null;
    }
  }

  static void hideKeyboard() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }

  static void logout() {
    HiveGeneralData.hive!.clear();
    HiveGeneralData.setUrl('');
    HiveGeneralData.setEmail('');
    HiveGeneralData.setPassword('');
    HiveGeneralData.setRememberMe(false);
    Get.offAll(() => LoginView());
  }

  //toasts
  static showToast(String msg) {
    Get.snackbar(
      'Uyarı',
      msg,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: Get.width / 10, vertical: 32),
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
    );
  }
}
