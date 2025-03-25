import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_exercising/db_keep/db_keep.dart';
import 'package:keep_exercising/pages/add_keep/add_keep_binding.dart';
import 'package:keep_exercising/pages/add_keep/add_keep_view.dart';
import 'package:keep_exercising/pages/keep_burn/keep_burn_binding.dart';
import 'package:keep_exercising/pages/keep_burn/keep_burn_view.dart';
import 'package:keep_exercising/pages/keep_main/keep_main_binding.dart';
import 'package:keep_exercising/pages/keep_main/keep_main_view.dart';
import 'package:keep_exercising/pages/keep_records/keep_records_binding.dart';
import 'package:keep_exercising/pages/keep_records/keep_records_view.dart';
import 'package:keep_exercising/pages/keep_setting/keep_setting_binding.dart';
import 'package:keep_exercising/pages/keep_setting/keep_setting_view.dart';
import 'package:keep_exercising/pages/no_network/no_network_binding.dart';
import 'package:keep_exercising/pages/no_network/no_network_view.dart';

import 'db_keep/db_config.dart';

Color primaryColor = const Color(0xff32d891);
Color bgColor = const Color(0xfff8f8f8);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBKeep().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Keeps,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Keeps = [
  GetPage(name: '/', page: () => const KeepBurnView(), binding: KeepBurnBinding()),
  GetPage(name: '/noNetwork', page: () => NoNetworkPage(), binding: NoNetworkBinding()),
  GetPage(name: '/keepMain', page: () => const KeepMainPage(), binding: KeepMainBinding()),
  GetPage(name: '/keepRecords', page: () => KeepRecordsPage(), binding: KeepRecordsBinding()),
  GetPage(name: '/configInit', page: () => const DbConfig()),
  GetPage(name: '/addKeep', page: () => AddKeepPage(), binding: AddKeepBinding()),
  GetPage(name: '/keepSetting', page: () => KeepSettingPage(), binding: KeepSettingBinding()),
];
