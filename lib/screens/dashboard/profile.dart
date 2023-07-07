import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/components/custom_round_botton.dart';
import 'package:store_app/data/controllers/auth_controller.dart';
import 'package:store_app/data/repositories/auth_repository.dart';
import 'package:store_app/screens/account_balance/account_balance.dart';
import 'package:store_app/screens/dashboard/orders.dart';
import 'package:store_app/screens/edit_profile/edit_profile.dart';
import 'package:store_app/screens/settings/settings.dart';
import 'package:store_app/utils/light_them.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // const CircularBackButton(

                      // ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            '${AuthController.storeModel.storeName}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: kwhiteContainer, fontSize: 20),
                          ))
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: -70,
                left: 140,
                right: 140,
                child: Container(
                  height: 120,
                  width: 140,
                  decoration: BoxDecoration(
                      color: AuthController.storeModel.imagePath == null
                          ? Colors.blue[400]
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          image: NetworkImage(
                            AuthController.storeModel.imagePath!,
                          ),
                          fit: BoxFit.cover),
                      border: Border.all(width: 5, color: kwhiteContainer)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.1,
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                '${AuthController.storeModel.email}',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).secondaryHeaderColor),
              )),
          SizedBox(
            height: Get.height * 0.02,
          ),
          ProfileListTile(
            onTap: () => Get.to(() => const EditProfile()),
            leadingIcon: Icons.person,
            title: 'profile'.tr,
          ),
           ProfileListTile(
            onTap: () {
              Get.to(()=>const Orders());
            },
            leadingIcon: Icons.edit_square,
            title: 'myorders'.tr,
          ),
          ProfileListTile(
            onTap: () => Get.to(const Settings()),
            leadingIcon: Icons.settings,
            title: 'settings'.tr,
          ),
          ProfileListTile(
            onTap: () => Get.to(() => const AccountBalance()),
            leadingIcon: Icons.credit_card,
            title: 'accountbalance'.tr,
          ),
           ProfileListTile(
            leadingIcon: Icons.warning_rounded,
            title: 'privacypolicy'.tr,
          ),
           ProfileListTile(
            leadingIcon: Icons.help_sharp,
            title: 'help'.tr,
          ),
           ProfileListTile(
            leadingIcon: Icons.double_arrow_sharp,
            title: 'aboutapp'.tr,
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          CustomRoundButton(
            onPresse: () {
              AuthService().logout();
            },
            title: 'logout'.tr,
            margin: const EdgeInsets.symmetric(horizontal: 50),
          )
        ],
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  final String? title;
  final IconData? leadingIcon;
  final Function()? onTap;

  const ProfileListTile({
    super.key,
    this.title,
    this.leadingIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kprimaryColor,
          ),
          child: Icon(
            leadingIcon,
            color: kwhiteContainer,
          )),
      title: Text(
        '$title',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).secondaryHeaderColor),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Theme.of(context).secondaryHeaderColor,
      ),
    );
  }
}
