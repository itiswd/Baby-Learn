import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:learn_baby/main.dart';
import 'package:learn_baby/pages/single_part.dart';

class BodyPartsController extends GetxController {
  final FlutterTts tts = FlutterTts();

  Future<void> playTextToSpeech(String text, double rate) async {
    await tts.setLanguage('ar-AE');
    await tts.setSpeechRate(rate);
    await tts.setVolume(1.0);
    await tts.setPitch(1);
    await tts.speak(text);
    await tts.awaitSpeakCompletion(true);
  }

  Future<void> stopTextToSpeech() async {
    await tts.stop();
  }

  @override
  void onInit() {
    if (Get.currentRoute == '/BodyParts') {
      final userName = namePrefs.getString('name');
      final prompt = userName == null
          ? 'يَلَّاْ نِعْرَفْ وِشِّنَاْ فِيْه إيْهْ'
          : 'يَلَّاْ يَاْ $userName نِعْرَفْ وِشِّنَاْ فِيْه إيْهْ';

      playTextToSpeech(prompt, 0.4);

      Future.delayed(
        const Duration(seconds: 6),
        () {
          Get.off(
            () => const SinglePart(),
            duration: const Duration(milliseconds: 400),
          );
        },
      );
    }
    super.onInit();
  }
}
