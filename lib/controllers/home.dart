import 'dart:async';
import 'dart:io';
import 'package:erpnext_viewer/controllers/base.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeController extends BaseController {
  @override
  void onInit() async {
    super.onInit();
    init();
  }

  Future<void> init() async {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    setBusy(false);
  }

  //states
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _keyFormHome = GlobalKey<FormState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  GlobalKey<FormState> get keyFormHome => _keyFormHome;

  final RxInt _loadingPercentage = 0.obs;
  int get loadingPercentage => _loadingPercentage.value;

  void homePush(int i) {
    update();
  }

  void changeLoadingPercentage(int value) {
    setBusy(true);
    _loadingPercentage.value = value;
    setBusy(false);
  }
}
