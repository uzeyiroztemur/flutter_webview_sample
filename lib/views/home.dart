import 'package:erpnext_viewer/controllers/home.dart';
import 'package:erpnext_viewer/utils/hive.dart';
import 'package:erpnext_viewer/utils/utilities.dart';
import 'package:erpnext_viewer/views/base.dart';
import 'package:erpnext_viewer/widgets/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final c = Get.put(HomeController());
  late final WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      statusbarBrightness: SystemUiOverlayStyle.light,
      child: Obx(() => c.busy
          ? const ActivityIndicator()
          : SafeArea(
              child: body(context),
            )),
    );
  }

  Widget body(context) {
    return Stack(
      children: [
        WebView(
          onWebViewCreated: (controller) {
            _controller = controller;
          },
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: '${HiveGeneralData.getUrl()}/login',
          onPageStarted: (url) {
            c.changeLoadingPercentage(0);
          },
          onProgress: (progress) {
            c.changeLoadingPercentage(progress);
          },
          onPageFinished: (url) {
            c.changeLoadingPercentage(100);
            if (url.contains('/login')) {
              _controller?.runJavascript('document.getElementById("login_email").value = "${HiveGeneralData.getEmail()}";');
              _controller?.runJavascript('document.getElementById("login_password").value = "${HiveGeneralData.getPassword()}";');
              _controller?.runJavascript("document.querySelector('.btn-login').click();");
            } else if (url == '${HiveGeneralData.getUrl()}/') {
              Utilities.logout();
            }
          },
        ),
        if (c.loadingPercentage < 100)
          LinearProgressIndicator(
            value: c.loadingPercentage / 100.0,
          ),
      ],
    );
  }
}
