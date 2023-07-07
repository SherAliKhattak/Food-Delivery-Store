// ignore_for_file: prefer_final_fields

import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/data/services/firebase_db.dart';
import 'package:store_app/models/store_model.dart';
import '../../components/snackbars.dart';

class AuthController extends GetxController implements GetxService{

  bool _isloading = false;
  bool get isLoading => _isloading;
  static StoreModel? _storeModel = StoreModel();
  static StoreModel get storeModel => _storeModel!;

  File? file;
  resetIsloading(bool state)
  {
    _isloading = state;
    update();
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
        file = File(result.files.first.path!);
      }
    } catch (e) {
      showSnackbar(content: e.toString(), color: Colors.red, context: context);
      log(e.toString());
    }
    update();
    return file;
  }

    static AuthController get i => Get.put(AuthController());


   Future updateStoreInfo({
    String? storeName,
    String? storeEmail,
    String? town,
    String? imagepath,
   
  }) async {
    Map<String, dynamic> toUpdate = {};
    if (storeName != null) {
      storeModel.storeName = storeName;
      toUpdate['store_name'] = storeName;
    }
    if (storeEmail != null) {
      storeModel.email = storeEmail;
      toUpdate['email'] = storeEmail;
    }
    if (town != null) {
      storeModel.town = town;
      toUpdate['town'] = town;
    }
    if (imagepath != null) {
      storeModel.imagePath = imagepath;
      toUpdate['image_path'] = imagepath;
    }
    if (toUpdate.isNotEmpty) {
       FirebaseFirestore.instance.collection('stores').doc(FirebaseAuth.instance.currentUser!.uid).update(toUpdate);
    }
  }

  updateProfilePic(BuildContext context) async {
    if (file != null) {
      // resetIsLoading(true);
      await FirebaseDB().storeProfileImage(
          "StoreProfilePic/${FirebaseAuth.instance.currentUser!.uid}", file!).then((value) => updateStoreInfo(imagepath: value).then((value) => FirebaseDB()
          .getCurrentStore()).then((value) {
            showSnackbar(context: context, content: 'Store Profile updated Successfully');
            file = null;
            log(file.toString());
          }));
      
      // await DBservice()
      //     .getDataFromFirestore()
      //     .then((value) => Preferences.saveUserData())
      //     .then((value) => Preferences().getDataFromSP());
      // resetIsLoading(false);
    } else {}
    update();
  }
}