import 'dart:async';
import 'package:erpnext_viewer/utils/hive.dart';
import 'package:erpnext_viewer/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'base.dart';

class LoginController extends BaseController {
  @override
  void onInit() async {
    super.onInit();
    init();
  }

  Future<void> init() async {
    setBusy(false);
  }

  //controllers
  final TextEditingController _urlController = TextEditingController();
  TextEditingController get urlController => _urlController;

  final TextEditingController _usernameController = TextEditingController();
  TextEditingController get usernameController => _usernameController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  final focusUrl = FocusNode();
  final focusUsername = FocusNode();
  final focusPassword = FocusNode();

  //states
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _keyFormLogin = GlobalKey<FormState>();

  final RxBool _obscureText = true.obs;
  final RxBool _rememberMe = true.obs;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  GlobalKey<FormState> get keyFormLogin => _keyFormLogin;

  bool get obscureText => _obscureText.value;
  bool get rememberMe => _rememberMe.value;

  void setObscureText(bool status) {
    _obscureText.value = status;
  }

  void setRememberMe(bool status) {
    _rememberMe.value = status;
  }

  void login() async {
    if (_keyFormLogin.currentState == null || _keyFormLogin.currentState!.validate()) {
      if (_rememberMe.value) {
        HiveGeneralData.setUrl(_urlController.value.text);
        HiveGeneralData.setEmail(_usernameController.value.text);
        HiveGeneralData.setPassword(_passwordController.value.text);
        HiveGeneralData.setRememberMe(_rememberMe.value);
      }
      Get.offAll(() => HomeView());
    }
  }
}
