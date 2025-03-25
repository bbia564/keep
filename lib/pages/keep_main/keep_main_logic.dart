import 'package:get/get.dart';
import 'package:keep_exercising/db_keep/db_keep.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeepMainLogic extends GetxController {
  DBKeep dbKeep = Get.find();

  var todayGetKcal = 0.obs;
  var todayExpendKcal = 0.obs;
  var targetKcal = 0.obs;
  var remainingKcal = 0.obs;

  void getData() async {
    var data = await dbKeep.getKeepAllData();
    final now = DateTime.now();
    final getData = data
        .where((element) =>
            element.createdTime.year == now.year &&
            element.createdTime.month == now.month &&
            element.createdTime.day == now.day && element.type == 0)
        .toList();
    final expendData = data
        .where((element) =>
            element.createdTime.year == now.year &&
            element.createdTime.month == now.month &&
            element.createdTime.day == now.day && element.type == 1)
        .toList();
    todayGetKcal.value =
        getData.fold(0, (previousValue, element) => previousValue + element.kcal);
    todayExpendKcal.value =
        expendData.fold(0, (previousValue, element) => previousValue + element.kcal);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    targetKcal.value = prefs.getInt('targetKcal') ?? 0;
    remainingKcal.value = (targetKcal.value - todayExpendKcal.value) <= 0 ? 0 : (targetKcal.value - todayExpendKcal.value);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
