import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_baby/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnterNameController extends GetxController {
  //Check if it is a name or no
  bool isName(String text) {
    final RegExp namePattern = RegExp(r'^[\u0600-\u06FF\s]');
    return namePattern.hasMatch(text) && text.trim().isNotEmpty;
  }

  //Entering name and saving it
  TextEditingController textEditingController = TextEditingController();
  addName() async {
    namePrefs = await SharedPreferences.getInstance();
    if (isName(textEditingController.text)) {
      Get.back();
      namePrefs.setString('name', textEditingController.text);
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          Get.snackbar(
            'تم بنجاح',
            'تم اضافة الاسم ${textEditingController.text} بنجاح',
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(16),
          );
        },
      );
      Get.back();
    } else {
      Get.back();
    }
    update();
  }
}
