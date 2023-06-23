import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

class MainController extends GetxController {
  var rating = 0.0.obs;
  var comment = ''.obs;


  @override
  void onClose() {}
  showRatingDialog() {
    Get.dialog(RatingDialog(
      starColor: Colors.amber,
      title: const Text('Property rating'),
      message: const Text(
          'Tap a star to set your rating. Add more description here if you want.'),
      image: Image.asset(
        "assets/logo1.png",
        height: 100,
      ),
      submitButtonText: 'Submit',
      onCancelled: () => ('cancelled'),
      onSubmitted: (response) {
        rating.value = response.rating;
        comment.value = response.comment;
      },
    ));
  }
}
