import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/components/custom_appbarr.dart';
import 'package:store_app/data/controllers/auth_controller.dart';
import 'package:store_app/data/services/firebase_db.dart';
import 'package:store_app/models/item_model.dart';
import 'package:store_app/screens/dashboard/orders.dart';
import 'package:store_app/screens/edit_profile/edit_profile.dart';
import 'package:store_app/screens/sign_up/add_items.dart';
import 'package:store_app/utils/light_them.dart';

import '../../components/images_paths.dart';
import '../notifications/notifications.dart';
import '../settings/settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: CustomAppBarr(
              leading: IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Theme.of(context).secondaryHeaderColor,
                  )),
              title: 'home'.tr,
              trailing: IconButton(
                  onPressed: () {
                    Get.to(() => const Notifications());
                  },
                  icon: Icon(
                    Icons.notifications,
                    color: Theme.of(context).secondaryHeaderColor,
                  )),
            )),
        drawer: const DrawerWidget(),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'earnings'.tr,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20,
                      color: Theme.of(context).secondaryHeaderColor),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[350]!),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          EarningsContainerWidget(
                            title: 'personalbalance'.tr,
                            price: '0\$',
                          ),
                          EarningsContainerWidget(
                            title: 'earninginjune'.tr,
                            price: '0\$',
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          EarningsContainerWidget(
                            title: 'totalorders'.tr,
                            price: '0',
                          ),
                          EarningsContainerWidget(
                            title: 'activeorders'.tr,
                            price: '0',
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'myitems'.tr,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).secondaryHeaderColor),
                    ),

                    // TextButton(
                    //     onPressed: () {},
                    //     child: Text(
                    //       'See All',
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .bodyLarge!
                    //           .copyWith(color: kprimaryColor),
                    //     ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                StreamBuilder<List<ItemModel>>(
                  stream: FirebaseDB().displayItems(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<ItemModel>? items = snapshot.data;
                      if (items != null && items.isNotEmpty) {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: items.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var item = items[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey[350]!),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ListTile(
                                  leading: Image.network(
                                    item.itemImage!,
                                    width: 70,
                                    fit: BoxFit.cover,
                                  ),
                                  title: Text(
                                    '${item.itemName}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(color: kprimaryColor),
                                  ),
                                  subtitle: Text(
                                    item.category ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .secondaryHeaderColor),
                                  ),
                                  trailing: Text(
                                    '\$ ${item.itemPrice}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .secondaryHeaderColor),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.2,
                            ),
                            Center(
                              child: Text(
                                'noitems'.tr,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 020,
        child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.close,
                          color: Theme.of(context).secondaryHeaderColor,
                        )),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 40,
                          child: Image.network(
                            AuthController.storeModel.imagePath!,
                            height: Get.height * .08,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * .03,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${AuthController.storeModel.storeName}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * .009,
                            ),
                            SizedBox(
                              height: 40,
                              child: TextButton(
                                onPressed: () {
                                  Get.to(() => const EditProfile());
                                },
                                child: Text(
                                  'View Profile',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              draweListTile(imagePath: Images.bell, title: 'notifications'.tr),
              draweListTile(
                  imagePath: Images.orders,
                  title: 'myorders'.tr,
                  onTap: () async {
                    Get.back();
                    Get.to(const Orders());
                  }),
              ListTile(
                onTap: () => Get.to(() => const AddItems(
                      title: 'Add New Items',
                    )),
                horizontalTitleGap: 0,
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.add,
                  size: 30,
                  color: kprimaryColor,
                ),
                title: Text(
                  'addnewitem'.tr,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).secondaryHeaderColor)
                ),
              ),
              draweListTile(
                  imagePath: Images.settings,
                  title: 'settings'.tr,
                  onTap: () => Get.to(() => const Settings())),
            ]));
  }

  ListTile draweListTile(
      {String? imagePath, String? title, Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0,
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(
        imagePath ?? Images.bell,
        height: Get.height * .03,
        color: const Color(0xFF2DC0BE),
      ),
      title: Text('$title',
          style: Theme.of(Get.context!)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(Get.context!).secondaryHeaderColor)),
    );
  }
}

class EarningsContainerWidget extends StatelessWidget {
  final String? title;
  final String? price;
  const EarningsContainerWidget({
    super.key,
    this.title,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 18, color: kprimaryColor),
        ),
        Text(
          '$price',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).secondaryHeaderColor,
              ),
        )
      ],
    );
  }
}
