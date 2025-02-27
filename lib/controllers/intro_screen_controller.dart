import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class IntroScreenController extends GetxController {
  final pageController = PageController();
  var currentIndex = 0.obs;
  final storage = GetStorage();

  void nextPage() {
    if (currentIndex.value < 2) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    } else {
      finishIntro();
    }
  }

  void skipToLast() {
    pageController.jumpToPage(2);
  }

  void goToPage(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void finishIntro() {
    storage.write('intro_seen', true);
    Get.offAllNamed('/home');
  }
}
