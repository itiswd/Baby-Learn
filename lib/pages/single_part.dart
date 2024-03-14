import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_baby/controller/single_part_controller.dart';
import 'package:learn_baby/widgets/main_button.dart';

class SinglePart extends StatelessWidget {
  const SinglePart({super.key});

  @override
  Widget build(BuildContext context) {
    SinglePartController singlePartController = Get.put(SinglePartController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GetBuilder<SinglePartController>(
          builder: (controller) {
            return IconButton(
              onPressed: () {
                singlePartController.timer!.cancel();
                singlePartController.stopTextToSpeech();
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GetBuilder<SinglePartController>(
            builder: (controller) {
              return controller.textListen == ''
                  ? const SizedBox()
                  : Card(
                      color: Colors.grey,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          controller.textListen,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    );
            },
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // MainButton(
              //   text: 'تم',
              //   color: Colors.amber,
              //   width: 80,
              //   height: 80,
              //   onPressed: () {
              //     Get.to(() => const FinalResult());
              //   },
              // ),
              // const SizedBox(width: 4),
              MainButton(
                text: 'تسجيل',
                color: Colors.green,
                width: 192,
                height: 80,
                onPressed: () {
                  singlePartController.timer!.cancel();
                  singlePartController.stopTextToSpeech();
                  singlePartController.listen();
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: Get.height / 8),
            Card(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular((Get.width - 64) / 2),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                singlePartController.partNuber == 1
                    ? 'assets/images/eye.jpg'
                    : singlePartController.partNuber == 2
                        ? 'assets/images/nose.jpg'
                        : 'assets/images/mouse.jpg',
                width: Get.width - 64,
                height: Get.width - 64,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
