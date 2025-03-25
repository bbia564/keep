import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:keep_exercising/db_keep/db_keep.dart';

import '../../db_keep/keep_entity.dart';

class AddKeepLogic extends GetxController {
  DBKeep dbKeep = Get.find();

  int type = 0;

  String kcal = '';
  String event = '';

  void commit() async {
    if (kcal.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter the calories');
      return;
    }
    if (int.parse(kcal) <= 0) {
      Fluttertoast.showToast(msg: 'Please enter the valid calories');
      return;
    }
    if (event.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter the event');
      return;
    }
    await dbKeep.insertKeepData(KeepEntity(
      id: 0,
      createdTime: DateTime.now(),
      type: type,
      kcal: int.parse(kcal),
      event: event,
    ));
    Fluttertoast.showToast(msg: 'Added successfully');
    Get.back();
  }
}
