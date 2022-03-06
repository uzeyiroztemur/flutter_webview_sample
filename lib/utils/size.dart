import 'package:get/get.dart';

double ratio = 1;

getSize() {
  double width = Get.width;
  if (width >= 768) {
    ratio = 1.5;
  } else if (width >= 560) {
    ratio = 1.2;
  } else {
    ratio = 1;
  }
  return ratio;
}

class UISize {
  static double autoSize = getSize();
}
