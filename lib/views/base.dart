import 'package:erpnext_viewer/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseView extends StatelessWidget {
  final SystemUiOverlayStyle? statusbarBrightness;
  final Widget child;

  const BaseView({
    Key? key,
    this.statusbarBrightness,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: statusbarBrightness ??
            const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                systemNavigationBarColor: Colors.white,
                systemNavigationBarIconBrightness: Brightness.dark,
                systemNavigationBarDividerColor: Colors.transparent),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: GestureDetector(onTap: () => Utilities.hideKeyboard(), child: child),
        ));
  }
}
