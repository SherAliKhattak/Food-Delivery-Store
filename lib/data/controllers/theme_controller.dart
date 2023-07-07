import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController implements GetxService{
  RxBool isLightTheme = false.obs;

  static ThemeController get i => Get.put(ThemeController());

}