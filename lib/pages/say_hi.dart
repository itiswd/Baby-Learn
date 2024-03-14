import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_baby/controller/say_hi_controller.dart';
import 'package:learn_baby/main.dart';

class SayHi extends GetView<SayHiController> {
  const SayHi({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SayHiController());
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/hi_back.png',
              width: Get.width,
              height: Get.height,
              fit: BoxFit.fill,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: Get.width - 16,
                    child: Center(
                      child: namePrefs.getString('name') == null
                          ? Text(
                              'اهلاً بيك',
                              style: TextStyle(
                                fontSize: Get.width / 8,
                                letterSpacing: 0,
                              ),
                            )
                          : Text.rich(
                              TextSpan(
                                text: 'اهلاً يا ',
                                style: TextStyle(
                                  fontSize: Get.width / 12,
                                  color: Colors.black,
                                  letterSpacing: 0,
                                ),
                                children: [
                                  TextSpan(
                                    text: namePrefs.getString('name'),
                                    style: TextStyle(
                                      fontSize: Get.width / 12,
                                      color: Colors.orange,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Image.asset(
                    'assets/images/hi.gif',
                    height: Get.height - 200,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
