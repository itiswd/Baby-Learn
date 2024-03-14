import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:learn_baby/main.dart';
import 'package:learn_baby/pages/final_resulat.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SinglePartController extends GetxController {
  int counter = 0;
  int partNuber = 1;
  Timer? timer;
  final FlutterTts tts = FlutterTts();

  //Text to speech
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

  //Speech to text variables
  stt.SpeechToText? speech;
  bool isListening = false;
  String textListen = '';
  double confidence = 1.0;

  void listen() async {
    resultPrefs = await SharedPreferences.getInstance();
    if (!isListening) {
      bool available = await speech!.initialize(
        onStatus: (val) => debugPrint('onStatus: $val'),
        onError: (val) => debugPrint('onError: $val'),
      );
      if (available) {
        isListening = true;
        update();
        speech!.listen(
          onResult: (val) {
            update();
            textListen = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              confidence = val.confidence;
            }
            final targetWord = partNuber == 1
                ? 'عين'
                : partNuber == 2
                    ? 'مناخير'
                    : 'بق';

            if (textListen.contains(targetWord)) {
              resultPrefs.setInt('result', 1);
            } else {
              resultPrefs.setInt('result', 0);
            }
            Future.delayed(
              const Duration(seconds: 2),
              () {
                Get.to(() => const FinalResult());
              },
            );
          },
          localeId: 'ar-AE',
        );
      }
    } else {
      isListening = false;
      speech!.stop();
      update();
    }
  }

  void startTimer(int partNumber) async {
    partNuber = partNumber == 1
        ? 2
        : partNumber == 2
            ? 3
            : 1;
    numPrefs = await SharedPreferences.getInstance();

    timer = Timer.periodic(
      const Duration(seconds: 4),
      (timer) {
        if (counter < 3) {
          playTextToSpeech('إيْ دَهْ', 0.4);
          Future.delayed(
            const Duration(seconds: 2),
            () {
              playTextToSpeech(
                partNuber == 1
                    ? 'عِيْنْ'
                    : partNuber == 2
                        ? 'مَنَخِيْرْ'
                        : 'بُؤْ',
                0.3,
              );
            },
          );
          counter++;
        } else if (counter == 3) {
          final userName = namePrefs.getString('name');
          final prompt = userName == null
              ? 'أُوْلْ إيْ دَهْ؟'
              : 'أُوْلْ يَاْ $userName إيْ دَهْ؟';
          playTextToSpeech(prompt, 0.4);
          counter++;
        } else {
          // Cancel the timer after 3 repetitions
          timer.cancel();
        }
      },
    );

    numPrefs.setInt('number', partNuber);
  }

  @override
  void onInit() {
    speech = stt.SpeechToText();
    if (Get.currentRoute == '/SinglePart') {
      startTimer(numPrefs.getInt('number') ?? 1);
    }
    super.onInit();
  }
}
