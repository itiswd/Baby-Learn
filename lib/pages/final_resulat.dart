import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_baby/controller/final_result_controller.dart';
import 'package:learn_baby/main.dart';
import 'package:lottie/lottie.dart';

class FinalResult extends StatelessWidget {
  const FinalResult({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FinalResultController());
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/hi_back.png',
            width: Get.width,
            height: Get.height,
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              resultPrefs.getInt('result') == 1
                  ? Image.asset(
                      'assets/images/bravo.gif',
                      width: Get.width,
                      height: Get.height - 200,
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      'assets/images/mistake.gif',
                      width: Get.width,
                      height: Get.height - 200,
                      fit: BoxFit.fill,
                    ),
            ],
          ),
          resultPrefs.getInt('result') == 1
              ? Lottie.asset(
                  'assets/images/selebrate.json',
                  width: Get.width,
                  height: Get.width,
                  fit: BoxFit.fill,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
