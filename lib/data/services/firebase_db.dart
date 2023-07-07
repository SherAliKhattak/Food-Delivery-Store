import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:store_app/data/controllers/auth_controller.dart';
import 'package:store_app/models/category_model.dart';
import 'package:store_app/models/item_model.dart';
import 'package:store_app/models/store_model.dart';

import '../../screens/sign_up/add_items.dart';
import '../controllers/store_controller.dart';

class FirebaseDB {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  storeStorageInfoToFirebase(String storeName, String email, String town) {
    try {
      log('i am here ...........');
      storeProfileImage(
              "StoreProfilePic/${FirebaseAuth.instance.currentUser!.uid}",
              AuthController.i.file!)
          .then((value) {
        _firestore
            .collection('stores')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set(StoreModel(
                    storeID: FirebaseAuth.instance.currentUser!.uid,
                    storeName: storeName,
                    email: email,
                    town: town,
                    imagePath: value)
                .toFirebase());
      });
    } catch (e) {
      log('here is the error ${e.toString()}');
    }
  }

  Future<String> storeProfileImage(String ref, File file) async {
    UploadTask uploadTask = _storage.ref().child(ref).putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  addCategoriesandItems({List<CategoryModel>? categories}) {
    try {
      _firestore
          .collection('stores')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'categories': categories,
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future addItem({ItemModel? itemModel, File? filePath}) async {
    storeProfileImage(
            "items/${FirebaseAuth.instance.currentUser!.uid}/$filePath",
            filePath!)
        .then((value) {
      FirebaseFirestore.instance
          .collection('stores')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('items')
          .doc()
          .set(ItemModel(
                  itemID: uuid.v1(),
                  itemName: itemModel!.itemName,
                  itemImage: value,
                  categoryID: uuid.v4(),
                  storeID: FirebaseAuth.instance.currentUser!.uid,
                  itemPrice: itemModel.itemPrice,
                  category: ItemsController.i.categoryName)
              .toJson());
    });
  }

  Stream<List<ItemModel>> displayItems() {
    return FirebaseFirestore.instance
        .collection('stores')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('items')
        .snapshots()
        .asyncMap((event) async{
          List<ItemModel> items = [];
          for(var i in event.docs){
            ItemModel item = ItemModel.fromJson(json: i);
            items.add(item);
            log(items.length.toString());
          }
          return items;
        });
  }

  Future<StoreModel> getCurrentStore() async {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  DocumentSnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance.collection('stores').doc(userId).get();
  StoreModel user = StoreModel.fromJson(snapshot.data()!);
  return user;
}


}
