import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:keep_exercising/db_keep/db_keep.dart';
import 'package:keep_exercising/pages/keep_main/keep_main_logic.dart';
import 'package:keep_exercising/pages/keep_setting/keep_text_field.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:styled_widget/styled_widget.dart';

class KeepSettingLogic extends GetxController {
  DBKeep dbKeep = Get.find();

  cleanKeepData() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to clean all records?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () async {
            await dbKeep.cleanKeepData();
            KeepMainLogic mainLogic = Get.find();
            mainLogic.getData();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  targetKcalData() async {
    final SharedPreferences prefs =
    await SharedPreferences.getInstance();
    int targetKcal = prefs.getInt('targetKcal') ?? 0;
    String title = targetKcal.toString();
    Get.dialog(AlertDialog(
      title: const Text(
        'Target Kcal',
        textAlign: TextAlign.center,
      ),
      content: Container(
        width: double.infinity,
        height: 50,
        child: KeepTextField(
            textAlign: TextAlign.center,
            maxLength: 5,
            value: title,
            isInteger: true,
            onChange: (v) {
              title = v;
            }),
      ).decorated(
          border: Border.all(color: const Color(0xffd3d3d3)),
          borderRadius: BorderRadius.circular(10)),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black45),
          ),
        ),
        TextButton(
          onPressed: () async {
            if (title.isEmpty) {
              Fluttertoast.showToast(msg: 'Please enter the value');
              return;
            }
            if (int.parse(title) <= 0) {
              Fluttertoast.showToast(msg: 'Please enter valid values');
              return;
            }
            await prefs.setInt('targetKcal', int.parse(title));
            KeepMainLogic mainLogic = Get.find();
            mainLogic.getData();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ));
  }

  aboutKeepUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/launcher.webp',
        width: 73,
        height: 73,
      ),
      children: [
        const Text("""We can track calories gained and burned for you"""),
      ],
      context: context,
    );
  }
}
