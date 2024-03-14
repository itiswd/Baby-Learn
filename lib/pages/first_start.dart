import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_baby/pages/say_hi.dart';
import 'package:learn_baby/widgets/main_button.dart';
import 'package:lottie/lottie.dart';

class FirstStart extends StatelessWidget {
  const FirstStart({super.key});

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
            child: MainButton(
              width: Get.width - 128,
              height: 96,
              text: 'ابدأ',
              color: const Color.fromARGB(169, 255, 162, 22),
              onPressed: () {
                Get.to(() => const SayHi());
              },
            ),
          ),
        ],
      ),
    );
  }
}
