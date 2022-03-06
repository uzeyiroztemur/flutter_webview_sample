import 'dart:async';
import 'package:erpnext_viewer/controllers/base.dart';
import 'package:erpnext_viewer/utils/hive.dart';
import 'package:erpnext_viewer/views/home.dart';
import 'package:erpnext_viewer/views/login.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  @override
  void onInit() async {
    super.onInit();
    init();
  }

  Future<void> init() async {
    setBusy(false);
    await 1.delay();

    if (HiveGeneralData.getUrl().isNotEmpty &&
        HiveGeneralData.getEmail().isNotEmpty &&
        HiveGeneralData.getPassword().isNotEmpty &&
        HiveGeneralData.getRememberMe()) {
      Get.to(() => HomeView());
    } else {
      Get.to(() => LoginView());
    }
  }
}
