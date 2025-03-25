import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'keep_records_logic.dart';

class KeepRecordsPage extends GetView<KeepRecordsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Record history'),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(child: Obx(() {
        return controller.list.value.isEmpty
            ? const Center(
                child: Text('No data'),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: controller.list.value.length,
                itemBuilder: (_, index) {
                  final entity = controller.list.value[index];
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: <Widget>[
                      Text(
                        entity.type == 0 ? 'Gain calories' : 'Burn calories',
                        style: const TextStyle(fontSize: 15),
                      ),
                      <Widget>[
                        Text(
                          '${entity.kcal}Kcal',
                          style: const TextStyle(fontSize: 26),
                        ),
                        Text(
                          entity.createdTimeStr,
                          style: const TextStyle(color: Colors.grey,fontSize: 12),
                        ),
                      ].toRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween),
                      Divider(
                        height: 25,
                        color: Colors.grey.shade300,
                      ),
                      Text(entity.event)
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                  ).decorated(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      border: Border.all(color: const Color(0xffe6e6e6))).marginOnly(bottom: 10);
                });
      })),
    );
  }
}
