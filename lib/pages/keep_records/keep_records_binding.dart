import 'package:get/get.dart';

import 'keep_records_logic.dart';

class KeepRecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KeepRecordsLogic());
  }
}
