import 'package:get/get.dart';

import 'keep_setting_logic.dart';

class KeepSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KeepSettingLogic());
  }
}
