import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  var scaffold = GlobalKey<ScaffoldState>();
  final RxBool _busy = true.obs;
  get busy => _busy.value;

  void setBusy(bool val) {
    _busy.value = val;
  }
}
