import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'keep_burn_logic.dart';

class KeepBurnView extends GetView<PageLogic> {
  const KeepBurnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.effertz.value
              ? const CircularProgressIndicator(color: Colors.purple)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.kwrviux();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
