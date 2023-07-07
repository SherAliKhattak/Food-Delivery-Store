import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:store_app/components/snackbars.dart';
import 'package:store_app/data/controllers/auth_controller.dart';
import 'package:store_app/screens/dashboard/bottom_nav_bar.dart';
import 'package:store_app/screens/onboarding/page_view_main.dart';
import 'package:store_app/utils/light_them.dart';
import '../../components/images_paths.dart';
import '../../data/services/firebase_db.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    Timer(
        const Duration(seconds: 6),
        (){
          FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      showSnackbar(
        context: Get.context,
        content: 'User is currently Signed out',
        color: Colors.black
      );
      
      Get.offAll(()=>const PageViewMain());
    } else {
      showSnackbar(
        context: Get.context,
        content: 'User is Signed in',
        color: Colors.green
      );
      FirebaseDB().getCurrentStore().then((value) {
        AuthController.storeModel.email = value.email;
        AuthController.storeModel.storeName = value.storeName;
        AuthController.storeModel.imagePath = value.imagePath;
        AuthController.storeModel.town = value.town;
        AuthController.storeModel.storeID = value.storeID;

        Get.offAll(()=>const DashBoardScreen());
      });
    }
  });
});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Images.logo),
               const  Text(
                  textAlign: TextAlign.center,
                  'App Name',
                  style: TextStyle(fontSize: 33,fontWeight: FontWeight.w500,color:Color(0xffFFFFFF)),
                ),
              ],
            ),
           SizedBox(height: Get.height*.3,),
            const SpinKitSpinningLines(
              size: 50,
              lineWidth: 5,
              itemCount: 2,
              color: Color(0xffFFFFFF),
            )
          ],
        ),
      ),
    );
  }
}
