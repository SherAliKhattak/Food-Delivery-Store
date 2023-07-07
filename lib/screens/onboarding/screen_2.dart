import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/images_paths.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
         const Text(
            textAlign: TextAlign.center,
            'Eco Friendly and\nßBio-Degratable.',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
          ),SizedBox(height: Get.height*.02,),
          const Text(
            textAlign: TextAlign.center,
            'Lorem ipsum dolor sit amet, consectetur\n adipiscing elit. Ac magna non.',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),SizedBox(height: Get.height*.02,),
          Image.asset(Images.onboarding2)
        ],
      ),
    );
  }
}