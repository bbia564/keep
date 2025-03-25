import 'package:get/get.dart';

import 'add_keep_logic.dart';

class AddKeepBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddKeepLogic());
  }
}
