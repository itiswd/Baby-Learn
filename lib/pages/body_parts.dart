import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_baby/controller/body_parts_controller.dart';
import 'package:learn_baby/main.dart';

class BodyParts extends GetView<BodyPartsController> {
  const BodyParts({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BodyPartsController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Stack(
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
                      SizedBox(
                        width: Get.width - 16,
                        child: Center(
                          child: namePrefs.getString('name') == null
                              ? Text(
                                  'يلا نعرف وشنا فيه ايه',
                                  style: TextStyle(
                                    fontSize: Get.width / 12,
                                    letterSpacing: 0,
                                  ),
                                )
                              : Text.rich(
                                  textAlign: TextAlign.center,
                                  TextSpan(
                                    text: 'يلا يا ',
                                    style: TextStyle(
                                      fontSize: Get.width / 12,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: namePrefs.getString('name')!,
                                        style: TextStyle(
                                          fontSize: Get.width / 12,
                                          color: Colors.orange,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' نعرف وشنا فيه ايه',
                                        style: TextStyle(
                                          fontSize: Get.width / 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Image.asset(
                        'assets/images/body_parts_hi.gif',
                        width: Get.width,
                        height: Get.height - 200,
                        fit: BoxFit.fill,
                      ),
                    ],
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
