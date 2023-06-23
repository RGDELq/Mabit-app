import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rating_controller.dart';

class HomeView extends GetView<MainController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rating section"),
        backgroundColor: const Color.fromARGB(255, 44, 73, 121),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(
                    'Your Rating: ${controller.rating.value}',
                    style: const TextStyle(fontSize: 20),
                  )),
              Obx(() => Text(
                    'Your Comment: ${controller.comment.value}',
                    style: const TextStyle(fontSize: 20),
                  )),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 44, 73, 121),
                  elevation: 9,
                ),
                onPressed: () {
                  controller.showRatingDialog();
                },
                child: const Text('Rating Dialog'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
