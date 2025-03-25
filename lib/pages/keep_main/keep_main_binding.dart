import 'package:get/get.dart';

import 'keep_main_logic.dart';

class KeepMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KeepMainLogic());
  }
}
