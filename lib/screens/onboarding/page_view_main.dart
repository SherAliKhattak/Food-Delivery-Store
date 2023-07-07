import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store_app/screens/onboarding/screen_1.dart';
import 'package:store_app/screens/onboarding/screen_2.dart';

import '../../components/custom_round_botton.dart';
import '../sign_in/sign_in_screen.dart';

class PageViewMain extends StatefulWidget {
  const PageViewMain({super.key});

  @override
  State<PageViewMain> createState() => _PageViewMainState();
}

class _PageViewMainState extends State<PageViewMain> {
  final PageController controller = PageController();
  List<Widget> screens = const <Widget>[OnBoarding1(), OnBoarding2()];
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: PageView(controller: controller, children: screens)),
            SmoothPageIndicator(
              controller: controller,
              count: 2,
              axisDirection: Axis.horizontal,
              effect: const SlideEffect(
                  spacing: 2.0,
                  radius: 4.0,
                  dotWidth: 24.0,
                  dotHeight: 8.0,
                  paintStyle: PaintingStyle.fill,
                  strokeWidth: 1.5,
                  dotColor: Color(0xffD9D9D9),
                  activeDotColor: Color(0xff00B22D)),
            ),
            SizedBox(
              height: Get.height * .06,
            ),
            CustomRoundButton(
              title: 'Continue',
              onPresse: () {
                Get.offAll(const SignInScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
