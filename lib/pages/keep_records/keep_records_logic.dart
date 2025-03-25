import 'package:get/get.dart';
import 'package:keep_exercising/db_keep/db_keep.dart';
import 'package:keep_exercising/db_keep/keep_entity.dart';

class KeepRecordsLogic extends GetxController {

  DBKeep dbKeep = Get.find();

  var list = <KeepEntity>[].obs;

  void getData() async {
    list.value = await dbKeep.getKeepAllData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
