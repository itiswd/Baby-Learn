import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:learn_baby/main.dart';
import 'package:learn_baby/pages/select_level.dart';

class SayHiController extends GetxController {
  //Text to speech
  final FlutterTts ftts = FlutterTts();
  Future<void> playTextToSpeech(String text) async {
    await ftts.setLanguage('ar-AE');
    await ftts.setSpeechRate(0.4);
    await ftts.setVolume(1.0);
    await ftts.setPitch(1);
    await ftts.speak(text);
  }

  @override
  void onInit() {
    if (namePrefs.getString('name') != null) {
      playTextToSpeech(
        "أهْلَنْ يَاْ ${namePrefs.getString('name')}ْ",
      );
    } else {
      playTextToSpeech(
        "أهْلَنْ بِيْيْكْ",
      );
    }
    Future.delayed(
      const Duration(seconds: 4),
      () => Get.off(
        () => const SelectLevel(),
        transition: Transition.fade,
        duration: const Duration(milliseconds: 400),
      ),
    );
    update();
    super.onInit();
  }
}
