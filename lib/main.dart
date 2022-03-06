import 'dart:developer';
import 'package:erpnext_viewer/controllers/splash.dart';
import 'package:erpnext_viewer/utils/hive.dart';
import 'package:erpnext_viewer/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.init((await getApplicationDocumentsDirectory()).path);
  HiveGeneralData.hive = await Hive.openBox('ERPNext Viewer');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ERPNext Viewer',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
      ),
      initialRoute: '/splash',
      getPages: getPages,
      onInit: onFirstRun,
      navigatorKey: Get.key,
    );
  }

  void onFirstRun() {
    Get.put(SplashController());
    log('app has started');
  }
}

List<GetPage> getPages = [
  GetPage(
    name: '/splash',
    page: () => SplashView(),
  ),
];
