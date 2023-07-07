// ignore_for_file: prefer_final_fields

import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/models/category_model.dart';
import 'package:store_app/models/item_model.dart';

import '../../components/snackbars.dart';

class ItemsController extends GetxController implements GetxService {
  final List<ItemModel> _items = [];
  List<ItemModel> get items => _items;
  List<CategoryModel> _categories = [
    CategoryModel(
      id: '1',
      name: 'Burger',
    ),
    CategoryModel(
      id: '2',
      name: 'Pizza ',
    ),
    CategoryModel(
      id: '3',
      name: 'Fries',
    ),
  ];
  List<CategoryModel> get categories => _categories;
  File? itemImage;
  late TextEditingController itemname;
  late TextEditingController itemPrice;
  String? categoryName;

  @override
  void onInit() {
    itemname = TextEditingController();
    itemPrice = TextEditingController();
    super.onInit();
  }


  updateCategory(String value) {
    categoryName = value.toString();
    update(['categories']);
  }

  Future<File?> pickImage(
    {
    FileType? type = FileType.image,
    BuildContext? context,}
  ) async {
    try {
      FilePickerResult? result = 
          await FilePicker.platform.pickFiles(type: type!);
      if (result != null) {
        itemImage = File(result.files.first.path!);
      }
    } catch (e) {
      showSnackbar(content: e.toString(), color: Colors.red, context: context);
      log(e.toString());
    }
    update();
    return itemImage;
  }
    static ItemsController get i => Get.put(ItemsController());

}
