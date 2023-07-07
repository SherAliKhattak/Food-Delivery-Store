import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/components/custom_round_botton.dart';
import 'package:store_app/components/custom_round_textfield.dart';
import 'package:store_app/components/snackbars.dart';
import 'package:store_app/data/controllers/auth_controller.dart';
import 'package:store_app/data/controllers/profile_controller.dart';
import '../../components/circular_back_botton.dart';
import '../../utils/light_them.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<AuthController>(builder: (contr) {
        return Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 150,
                  decoration: const BoxDecoration(
                      color: kprimaryColor,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50))),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        const CircularBackButton(
                          
                        ),
                        Align(
                            widthFactor: 4.2,
                            alignment: Alignment.center,
                            child: Text(
                              'profile'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: kwhiteContainer, fontSize: 20),
                            ))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -70,
                  left: 140,
                  right: 140,
                  child: InkWell(
                    onTap: () {
                      AuthController.i.pickImage();
                    },
                    child: Container(
                      height: 120,
                      width: 140,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                AuthController.storeModel.imagePath!,
                              ),
                              fit: BoxFit.cover),
                          color: Colors.blue[400],
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 5, color: kwhiteContainer)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            EditProfileRow(
              controller: ProfileController.i.storeName,
              icon: Icons.person,
              hintText: AuthController.storeModel.storeName ?? 'Store Name',
            ),
            //    EditProfileRow(

            //   icon: Icons.email ,
            //   hintText: AuthController.storeModel.email ?? 'youremail@gmail.com',
            //  ),

            EditProfileRow(
              controller: ProfileController.i.town,
              icon: Icons.home,
              hintText: '${AuthController.storeModel.town}',
            ),
            //  const  EditProfileRow(
            //   icon: Icons.pin_drop ,
            //   hintText: 'Address',
            //  ),
            const Spacer(),
            CustomRoundButton(
              onPresse: () {
                if (ProfileController.i.storeName.text.isNotEmpty ||
                    ProfileController.i.town.text.isNotEmpty) {
                  
                  AuthController.i.updateStoreInfo(
                    storeName: ProfileController.i.storeName.text,
                    town: ProfileController.i.town.text,
                  );
                  showSnackbar(context: context,content: 'Data updated Successfully',color: Colors.black);
                }
                if (AuthController.i.file?.path != null) {
                  AuthController.i.updateProfilePic(context);
                }
              },
              title: 'update'.tr,
              margin: const EdgeInsets.symmetric(horizontal: 40),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        );
      }),
    );
  }
}

class EditProfileRow extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final TextEditingController? controller;
  const EditProfileRow({
    super.key,
    this.hintText,
    this.icon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0).copyWith(top: 0, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              color: kprimaryColor,
              child: Icon(
                icon,
                color: kwhiteContainer,
              )),
          SizedBox(
            width: Get.width * 0.05,
          ),
          Expanded(
            child: CustomRoundTextfield(
              controller: controller,
              hintText: '$hintText',
              // suffixIcon: const Icon(
              //   Icons.edit,
              //   color: kprimaryColor,
              // ),
            ),
          )
        ],
      ),
    );
  }
}
