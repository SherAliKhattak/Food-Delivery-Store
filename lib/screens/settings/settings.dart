import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/components/circular_back_botton.dart';
import 'package:store_app/components/custom_appbarr.dart';
import 'package:store_app/data/services/local_db.dart';
import 'package:store_app/screens/dashboard/profile.dart';
import 'package:store_app/screens/language.dart';
import 'package:store_app/screens/turn_on_notifs/notification_turn_on.dart';
import 'package:store_app/utils/light_them.dart';

import '../../data/controllers/theme_controller.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: const  Size.fromHeight(80),
          child: CustomAppBarr(
            title: 'settings'.tr,
            leading:const  CircularBackButton(),
          )),
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.05,
          ),
          ProfileListTile(
            leadingIcon: Icons.notifications,
            title: 'notifications'.tr,
            onTap: () => Get.to(() => const NotificationTurnOn()),
          ),
           ProfileListTile(
            onTap: () {
              Get.to(()=>const LanguageSelect());
            },
            leadingIcon: Icons.language,
            title: 'language'.tr,
          ),
          ListTile(
              onTap: () {},
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kprimaryColor,
                  ),
                  child: const Icon(
                    Icons.dark_mode,
                    color: kwhiteContainer,
                  )),
              title: Text(
                'darkmode'.tr,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).secondaryHeaderColor),
              ),
              trailing: CupertinoSwitch(
                  activeColor: kprimaryColor,
                  value: ThemeController.i.isLightTheme.value,
                  onChanged: (value) {
                    ThemeController.i.isLightTheme.value = value;
                    Get.changeThemeMode(ThemeController.i.isLightTheme.value
                        ? ThemeMode.dark
                        : ThemeMode.light);
                    Preferences().saveThemeStatus();
                  }))
        ],
      ),
    );
  }
}
