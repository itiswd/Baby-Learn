import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_baby/controller/enter_name_controller.dart';
import 'package:learn_baby/main.dart';
import 'package:learn_baby/widgets/main_button.dart';
import 'package:lottie/lottie.dart';

class EnterName extends StatelessWidget {
  const EnterName({super.key});

  @override
  Widget build(BuildContext context) {
    EnterNameController enterNameController = Get.put(EnterNameController());
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(80),
              ),
              clipBehavior: Clip.antiAlias,
              child: TextField(
                controller: enterNameController.textEditingController,
                textDirection: TextDirection.rtl,
                style: const TextStyle(fontSize: 32),
                decoration: InputDecoration(
                  hintText: namePrefs.getString('name') ?? 'اكتب الاسم',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(32),
                ),
              ),
            ),
            const SizedBox(height: 16),
            MainButton(
              width: Get.width / 2,
              height: 72,
              text: 'ادخال',
              color: const Color.fromARGB(169, 255, 162, 22),
              onPressed: enterNameController.addName,
            ),
          ],
        ),
      ],
    ));
  }
}
