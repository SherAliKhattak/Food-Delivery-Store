// ignore_for_file: unused_local_variable, library_private_types_in_public_api

import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/components/circular_back_botton.dart';
import 'package:store_app/components/custom_appbarr.dart';
import 'package:store_app/components/custom_round_botton.dart';
import 'package:store_app/components/custom_round_textfield.dart';
import 'package:store_app/data/services/firebase_db.dart';
import 'package:store_app/models/item_model.dart';
import 'package:store_app/screens/dashboard/bottom_nav_bar.dart';
import 'package:store_app/screens/sign_up/sign_up_screen.dart';
import 'package:store_app/utils/light_them.dart';
import 'package:uuid/uuid.dart';
import '../../data/controllers/auth_controller.dart';
import '../../data/controllers/store_controller.dart';

var uuid = const Uuid();

class AddItems extends StatefulWidget {
  final String? title;
  const AddItems({Key? key, this.title}) : super(key: key);

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  TextEditingController itemName = TextEditingController();
  TextEditingController itemPrice = TextEditingController();
  File? file;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put<ItemsController>(ItemsController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppBarr(
          title: widget.title!,
          leading: widget.title == 'Let\'s Sign Up'
              ? const SizedBox.shrink()
              : const CircularBackButton(),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20).copyWith(bottom: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ItemWidget(
                itemName: itemName,
                itemPrice: itemPrice,
                file: file,
                dropDownvalue: ItemsController.i.categoryName,
              ),
              SizedBox(height: Get.height * 0.05),
              primaryButtonToDisplay(widget.title),
              if (widget.title == 'Let\'s Sign Up')
                const HaveAnAccountWidget()
              else
                const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget primaryButtonToDisplay(String? title) {
    if (title == 'Let\'s Sign Up') {
      return CustomRoundButton(
        title: 'Sign up',
        onPresse: () async {
          await FirebaseDB()
              .addItem(
                  itemModel: ItemModel(
                    itemID: uuid.v1(),
                    itemName: itemName.text,
                    itemImage: '',
                    categoryID: uuid.v4(),
                    storeID: FirebaseAuth.instance.currentUser!.uid,
                    itemPrice: itemPrice.text,
                    category: ItemsController.i.categoryName,
                  ),
                  filePath: ItemsController.i.itemImage)
              .then((value) async{
            // Get.offAll(()=> const DashBoardScreen());
          await  FirebaseDB().getCurrentStore().then((value) {
              AuthController.storeModel.email = value.email;
              AuthController.storeModel.storeName = value.storeName;
              AuthController.storeModel.imagePath = value.imagePath;
              AuthController.storeModel.town = value.town;
              AuthController.storeModel.storeID = value.storeID;
            });
          });
          Get.offAll(()=>const DashBoardScreen());
        },
      );
    } else if (title == 'Add New Items') {
      return CustomRoundButton(
        title: 'Save',
        onPresse: () {
          FirebaseDB()
              .addItem(
                  itemModel: ItemModel(
                      itemID: uuid.v1(),
                      itemName: itemName.text,
                      itemImage: '',
                      categoryID: uuid.v4(),
                      storeID: FirebaseAuth.instance.currentUser!.uid,
                      itemPrice: itemPrice.text,
                      category: ItemsController.i.categoryName),
                  filePath: ItemsController.i.itemImage)
              .then((value) async{
                 await  FirebaseDB().getCurrentStore().then((value) {
              AuthController.storeModel.email = value.email;
              AuthController.storeModel.storeName = value.storeName;
              AuthController.storeModel.imagePath = value.imagePath;
              AuthController.storeModel.town = value.town;
              AuthController.storeModel.storeID = value.storeID;
            });
                      Get.offAll(()=>const DashBoardScreen());

          
              });
        },
      );
    } else {
      return CustomRoundButton(
        title: 'Update',
        onPresse: () {
          Get.to(() => const DashBoardScreen());
        },
      );
    }
  }
}

class ItemWidget extends StatefulWidget {
  final File? file;
  final TextEditingController? itemName;
  final TextEditingController? itemPrice;
  final String? dropDownvalue;

  const ItemWidget({
    Key? key,
    this.file,
    required this.itemName,
    required this.itemPrice,
    this.dropDownvalue,
  }) : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.dropDownvalue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRoundTextfield(
            controller: widget.itemName,
            hintText: 'Item Name',
          ),
          SizedBox(height: Get.height * 0.02),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<ItemsController>(builder: (contr) {
                return Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    image: ItemsController.i.itemImage != null
                        ? DecorationImage(
                            image: FileImage(
                              ItemsController.i.itemImage!,
                            ),
                            fit: BoxFit.cover)
                        : const DecorationImage(image: AssetImage('')),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromARGB(112, 137, 135, 135)),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        ItemsController.i.pickImage();
                      },
                      icon: contr.itemImage == null
                          ? const Icon(
                              Icons.add,
                              size: 30,
                              color: kprimaryColor,
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                );
              }),
              SizedBox(width: Get.width * 0.03),
              GetBuilder<ItemsController>(
                id: 'categories',
                builder: (contr) {
                  return Expanded(
                    child: Column(
                      children: [
                        DropdownButtonFormField(
                          focusColor: kprimaryColor,
                          isDense: true,
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(gapPadding: 20,borderSide:  BorderSide(color: kprimaryColor),),
                              border: OutlineInputBorder(gapPadding: 20,borderSide:  BorderSide(color: kprimaryColor),)),
                          value: 'Burger',
                          borderRadius: BorderRadius.circular(10),
                          hint:  Text('Select a Category', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: kgreyContainer),),
                          items: ItemsController.i.categories.map((e) {
                            return DropdownMenuItem(
                              
                                value: e.name.toString(), child: Text(e.name!));
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedValue = newValue.toString();
                            });
                            contr.updateCategory(newValue!);
                            log(newValue);
                          },
                          isExpanded: true,
                        ),
                        SizedBox(height: Get.height * 0.02),
                        CustomRoundTextfield(
                          controller: widget.itemPrice,
                          hintText: 'Price',
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
