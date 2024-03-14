import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_baby/pages/body_parts.dart';
import 'package:learn_baby/pages/enter_name.dart';
import 'package:lottie/lottie.dart';

import '../widgets/main_button.dart';

class SelectLevel extends StatelessWidget {
  const SelectLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Lottie.asset(
            'assets/images/background01.json',
            width: Get.width,
            height: Get.height,
            repeat: true,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainButton(
                  width: Get.width / 1.5,
                  height: 96,
                  text: 'ادراك الوجوه',
                  color: Colors.black26,
                  onPressed: () async {
                    Get.to(() => const BodyParts());
                  },
                ),
                const SizedBox(height: 16),
                MainButton(
                  width: Get.width / 1.5,
                  height: 96,
                  text: 'التعبيرات الوجهية',
                  color: Colors.black26,
                  onPressed: () {},
                ),
                const SizedBox(height: 16),
                MainButton(
                  width: Get.width / 2,
                  height: 80,
                  text: 'ادخال الاسم',
                  color: const Color.fromARGB(169, 255, 162, 22),
                  onPressed: () {
                    Get.to(
                      () => const EnterName(),
                      transition: Transition.leftToRightWithFade,
                      duration: const Duration(milliseconds: 300),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
