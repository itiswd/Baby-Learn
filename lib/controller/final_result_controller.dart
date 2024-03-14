import 'package:get/get.dart';
import 'package:learn_baby/controller/single_part_controller.dart';
import 'package:learn_baby/main.dart';

class FinalResultController extends SinglePartController {
  @override
  void onInit() async {
    if (resultPrefs.getInt('result') == 1) {
      playTextToSpeech('برافوْ عَلِيْكْ', 0.4);
    } else {
      playTextToSpeech('غلطْ', 0.4);
    }
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Get.back();
      },
    );
    update();
    super.onInit();
  }
}
