import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/data/controllers/theme_controller.dart';

class Preferences {
  saveThemeStatus() async {
    var controller = ThemeController.i;
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('theme', controller.isLightTheme.value);
    log('${pref.setBool('theme', controller.isLightTheme.value)}');
  }

  getThemeStatus() async {
    var controller = ThemeController.i;
    var isLight =
        SharedPreferences.getInstance().then((SharedPreferences prefs) async {
      return prefs.getBool('theme') ?? true;
    }).obs;
    controller.isLightTheme.value = await isLight.value;
    Get.changeThemeMode(
        controller.isLightTheme.value ? ThemeMode.dark : ThemeMode.light);
  }
}