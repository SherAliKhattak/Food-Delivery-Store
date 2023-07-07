// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/components/circular_back_botton.dart';
import 'package:store_app/components/custom_appbarr.dart';

import '../../utils/constants.dart';
import '../data/controllers/language_controller.dart';

class LanguageSelect extends StatefulWidget {
  const LanguageSelect({super.key});

  @override
  State<LanguageSelect> createState() => _LanguageSelectState();
}

class _LanguageSelectState extends State<LanguageSelect> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar:  PreferredSize(preferredSize: const Size.fromHeight(80),
      child: CustomAppBarr(
        title: 'language'.tr,
        leading: const CircularBackButton(),
      )),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'prefferedLanguage'.tr,
              style: TextStyle(
                  letterSpacing: 0.8,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).secondaryHeaderColor),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Text(
              'sameLanguage'.tr,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            // CustomRoundTextfield(
            //   controller: _controller,
            //   hintText: 'search'.tr,
              
              
            //   prefixIcon: Icons.search_rounded,
            //   prefixIconColor: Theme.of(context).hintColor,
            // ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Flexible(
              child: GetBuilder<LanguageController>(builder: (langCont) {
                return ListView.separated(
                    itemCount: languages.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: ((context, index) {
                      final lang = languages[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            onTap: () {
                              langCont.updateSelectedIndex(index);
                              langCont.updateLocale(lang.locale!);
                            },
                            tileColor: langCont.selectedIndex == index
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).cardColor,
                            contentPadding: const EdgeInsets.only(
                                left: 15, right: 15, top: 2, bottom: 2),
                            leading: ClipOval(
                              child: Image.asset(
                                lang.image!,
                                height: 30,
                                width: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(lang.name!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: langCont.selectedIndex == index
                                      ? const Color(0xFFFFFFFF)
                                      : Theme.of(context).secondaryHeaderColor,
                                )),
                            trailing: langCont.selectedIndex == index
                                ? const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 10,
                                    child: Icon(
                                      Icons.check,
                                      size: 15,
                                    ),
                                  )
                                : const SizedBox()),
                      );
                    }));
              }),
            ),
            
          ],
        ),
      )),
    );
  }
}