import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_exercising/main.dart';
import 'package:keep_exercising/pages/keep_setting/keep_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import 'add_keep_logic.dart';

class AddKeepPage extends GetView<AddKeepLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Record calories'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<AddKeepLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.all(8),
                child: <Widget>[
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Get calories',
                      style: TextStyle(
                          color:
                              controller.type == 0 ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )
                          .decorated(
                              color: controller.type == 0
                                  ? primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(17))
                          .gestures(onTap: () {
                    controller.type = 0;
                    controller.update();
                  })),
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Burn calories',
                      style: TextStyle(
                          color:
                              controller.type == 1 ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )
                          .decorated(
                              color: controller.type == 1
                                  ? primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(17))
                          .gestures(onTap: () {
                    controller.type = 1;
                    controller.update();
                  }))
                ].toRow(),
              ).decorated(
                  border: Border.all(color: const Color(0xffe6e6e6)),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: <Widget>[
                  const Text(
                    'Kcal',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: KeepTextField(
                          maxLength: 5,
                          textAlign: TextAlign.end,
                          isInteger: true,
                          value: controller.kcal,
                          onChange: (v) {
                            controller.kcal = v;
                          }))
                ].toRow(),
              ).decorated(
                  border: Border.all(color: const Color(0xffe6e6e6)),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: <Widget>[
                  const Text(
                    'Event',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: KeepTextField(
                          maxLength: 5,
                          textAlign: TextAlign.end,
                          value: controller.event,
                          onChange: (v) {
                            controller.event = v;
                          }))
                ].toRow(),
              ).decorated(
                  border: Border.all(color: const Color(0xffe6e6e6)),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                child: const Text(
                  'Commit',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              )
                  .decorated(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryColor)
                  .gestures(onTap: () {
                    controller.commit();
              })
            ].toColumn(),
          );
        }).marginAll(15)),
      ),
    );
  }
}
