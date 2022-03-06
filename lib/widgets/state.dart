import 'package:erpnext_viewer/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ActivityIndicator extends StatelessWidget {
  const ActivityIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: BoxDecoration(color: Colors.white.withOpacity(.3)),
      child: Center(
          child: SizedBox(
        width: UISize.autoSize * 54,
        height: UISize.autoSize * 54,
        child: const LoadingIndicator(
          indicatorType: Indicator.circleStrokeSpin,
          colors: [
            Colors.orange,
          ],
        ),
      )),
    );
  }
}

class ListLoadingIndicator extends StatelessWidget {
  const ListLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: UISize.autoSize * 48,
      height: UISize.autoSize * 48,
      child: const LoadingIndicator(
        indicatorType: Indicator.ballBeat,
        colors: [
          Colors.orange,
        ],
      ),
    ));
  }
}
