import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_exercising/main.dart';
import 'package:keep_exercising/pages/keep_main/progress_widget.dart';
import 'package:styled_widget/styled_widget.dart';

import 'keep_main_logic.dart';

class KeepMainPage extends StatefulWidget {
  const KeepMainPage({Key? key}) : super(key: key);

  @override
  State<KeepMainPage> createState() => _KeepMainPageState();
}

class _KeepMainPageState extends State<KeepMainPage> {
  KeepMainLogic controller = Get.find();

  void checkNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      Get.toNamed('/noNetwork');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    checkNetwork();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: <Widget>[
          Image.asset(
            'assets/bg.webp',
            width: double.infinity,
            height: 338,
            fit: BoxFit.cover,
          ),
          SafeArea(
              child: <Widget>[
                const Text(
                  'Keep exercising',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Lose weight every day',
                  style: TextStyle(color: Colors.black45),
                )
              ]
                  .toColumn(crossAxisAlignment: CrossAxisAlignment.start)
                  .marginOnly(top: 70, left: 15)),
          SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      child: <Widget>[
                        <Widget>[
                          Obx(() {
                            return ProgressWidget(
                              progress: controller.todayExpendKcal.value /
                                  controller.targetKcal.value,
                              size: 150,
                            );
                          }),
                          Positioned(
                              top: 50,
                              width: 150,
                              child: Obx(() {
                                return Text(
                                  controller.remainingKcal.value.toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 23, fontWeight: FontWeight.bold),
                                );
                              })),
                          const Positioned(
                              top: 80,
                              width: 150,
                              child: Text(
                                'Remaining',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey),
                              )),
                        ].toStack().marginOnly(top: 20),
                        const SizedBox(
                          height: 20,
                        ),
                        <Widget>[
                          Expanded(
                              child: <Widget>[
                                Obx(() {
                                  return Text(
                                    controller.todayGetKcal.value.toString(),
                                    style: const TextStyle(
                                        fontSize: 26, fontWeight: FontWeight.bold),
                                  );
                                }),
                                const Text(
                                  'Get calories Today',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ].toColumn()),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: <Widget>[
                                Obx(() {
                                  return Text(
                                    controller.todayExpendKcal.value.toString(),
                                    style: const TextStyle(
                                        fontSize: 26, fontWeight: FontWeight.bold),
                                  );
                                }),
                                const Text(
                                  'Calories burned Today',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ].toColumn())
                        ].toRow(),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          alignment: Alignment.center,
                          child: const Text(
                            'Record calories',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                            .decorated(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10))
                            .gestures(onTap: () {
                          Get.toNamed('/addKeep')?.then((_) {
                            controller.getData();
                          });
                        }),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          alignment: Alignment.center,
                          child: const Text(
                            'Record history',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                            .decorated(
                            color: const Color(0xff606060),
                            borderRadius: BorderRadius.circular(10))
                            .gestures(onTap: () {
                          Get.toNamed('/keepRecords');
                        })
                      ].toColumn(),
                    ).decorated(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xffe6e6e6))),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'Setting',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ).decorated(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xffe6e6e6))).gestures(onTap: (){
                      Get.toNamed('/keepSetting');
                    })
                  ].toColumn(),
                ).marginAll(15),
              )).marginOnly(top: 150)
        ].toStack(),
      ),
    );
  }
}

