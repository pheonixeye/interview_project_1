import 'package:get/get.dart';

class PxBotNavIndex extends GetxController {
  var index = 0;

  void selectIndex(int val) {
    index = val;
    update();
  }
}
