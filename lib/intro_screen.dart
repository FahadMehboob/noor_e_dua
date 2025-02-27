import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noor_e_dua/controllers/intro_screen_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/intro_screen_widget.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IntroScreenController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: (value) => controller.currentIndex.value = value,
            children: const [
              IntroScreenContent(
                image: 'assets/images/intro_1.png',
                heading: 'Welcome to Noor-e-Dua',
                subheading:
                    'Your go-to app for daily Islamic duas, including Ashra, Sehri, and Iftar duas.',
              ),
              IntroScreenContent(
                image: 'assets/images/intro_2.png',
                heading: 'Essential Duas for Every Occasion',
                subheading:
                    'Find and read important duas for fasting, prayers, and daily life with ease.',
              ),
              IntroScreenContent(
                image: 'assets/images/intro_3.png',
                heading: 'Set Daily Reminders',
                subheading:
                    'Never miss an important dua! Get notifications for Sehri, Iftar, and daily supplications.',
              ),
            ],
          ),
          Align(
            alignment: const Alignment(0, 0.8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      controller.currentIndex.value < 2
                          ? GestureDetector(
                              onTap: controller.skipToLast,
                              child: Container(
                                width: 70,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black38)),
                                child: const Center(
                                  child: Text(
                                    'Skip',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.orangeAccent),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(width: 70),
                      SmoothPageIndicator(
                        controller: controller.pageController,
                        count: 3,
                        effect: ExpandingDotsEffect(
                          expansionFactor: 4,
                          dotHeight: 10,
                          dotWidth: 10,
                          dotColor: Colors.grey.shade400,
                          activeDotColor: Colors.orangeAccent,
                        ),
                        onDotClicked: controller.goToPage,
                      ),
                      GestureDetector(
                        onTap: controller.nextPage,
                        child: Container(
                          width: 80,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black38)),
                          child: Center(
                            child: Text(
                              controller.currentIndex.value < 2
                                  ? 'Next'
                                  : 'Finish',
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.orangeAccent),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
