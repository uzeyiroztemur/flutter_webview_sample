import 'package:erpnext_viewer/controllers/splash.dart';
import 'package:erpnext_viewer/views/base.dart';
import 'package:erpnext_viewer/widgets/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  final c = Get.put(SplashController());

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      statusbarBrightness: SystemUiOverlayStyle.light,
      child: Obx(
        () => c.busy
            ? const ActivityIndicator()
            : Scaffold(
                key: _scaffoldKey,
                body: body(),
                backgroundColor: Colors.orange,
              ),
      ),
    );
  }

  Widget body() {
    return Container(
      height: Get.size.height,
      width: Get.size.width,
      decoration: const BoxDecoration(color: Colors.orange),
      child: const Center(),
    );
  }
}
