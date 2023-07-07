// ignore_for_file: unused_field

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/components/snackbars.dart';
import 'package:store_app/data/controllers/auth_controller.dart';
import 'package:store_app/data/services/firebase_db.dart';
import 'package:store_app/screens/dashboard/bottom_nav_bar.dart';
import 'package:store_app/screens/sign_in/sign_in_screen.dart';
import 'package:store_app/screens/sign_up/add_items.dart';


class AuthService {
  final _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;
  final _firestore = FirebaseFirestore.instance;

  registerStore({String? email, String? password, String? storeName, town}) async {
    try {
      AuthController.i.resetIsloading(true);
       await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!);
               
        await FirebaseDB().storeStorageInfoToFirebase(storeName!,email,town);
        Get.offAll(() => const AddItems(title: 'Let\'s Sign Up',));
      AuthController.i.resetIsloading(false);
    } catch (e) {
      log('$e is the error');
      AuthController.i.resetIsloading(false);
    }
  }

  Future<void> loginStore({String? email, String? password}) async {
    try {
      AuthController.i.resetIsloading(true);
      await _auth.signInWithEmailAndPassword(email: email!, password: password!).then((value) {
       Get.offAll(()=> const DashBoardScreen());
      });
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuthExceptions
      if (e.code == 'user-not-found') {
        showSnackbar(
          context: Get.context,
          content: 'User not found. Please check your email and password.',
          color: Colors.black,
        );
      } else if (e.code == 'wrong-password') {
        showSnackbar(
          context: Get.context,
          content: 'Wrong password. Please try again.',
          color: Colors.black,
        );
      } else {
        showSnackbar(
          context: Get.context,
          content: '$e',
          color: Colors.black,
        );
      }
    } catch (e) {
      showSnackbar(
        context: Get.context,
        content: 'Some error occurred. Please try again.',
        color: Colors.black,
      );
    } finally {
      AuthController.i.resetIsloading(false);
    }


  }
  Future logout() async{
      try{
      AuthController.i.resetIsloading(true);
      _auth.signOut().then((value) => Get.offAll(()=> const SignInScreen()));
       AuthController.i.resetIsloading(false);
      }
      catch(e){
        showSnackbar(
          context: Get.context, content: 'Some error Occured',color: Colors.black
        );
      }
    }


 
  
 
}
