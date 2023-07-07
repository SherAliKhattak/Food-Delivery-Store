import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController implements GetxService{

  late TextEditingController storeName;
  late TextEditingController town;

  @override
  void onInit() {
    storeName = TextEditingController();
    town = TextEditingController();
    super.onInit();
  }
    static ProfileController get i => Get.put(ProfileController());

}