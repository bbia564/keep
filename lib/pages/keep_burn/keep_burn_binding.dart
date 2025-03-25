import 'package:get/get.dart';

import 'keep_burn_logic.dart';

class KeepBurnBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
