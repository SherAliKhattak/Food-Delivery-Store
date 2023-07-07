
import 'package:store_app/models/category_model.dart';

class StoreModel {
  String? storeID;
  String? imagePath;
  String? storeName;
  String? email;
  String? town;
  List<CategoryModel>? categories;

  StoreModel(
      {this.storeID, this.storeName, this.email, this.town, this.imagePath});

  StoreModel.fromJson(Map<String, dynamic> json) {
    storeID = json['store_id'];
    imagePath = json['image_path'];
    storeName = json['store_name'];
    email = json['email'];
    town = json['town'];
    if (json['categories'] != null) {
      categories = <CategoryModel>[];
      json['towns'].forEach((v) {
        categories!.add(CategoryModel?.fromJson(v));
      });
    }
  }

  toFirebase()
  {
    return {
      "store_id": storeID,
      "image_path": imagePath,
      "store_name": storeName,
      "email": email,
      "town": town,
      "categories": categories
    };
  }
  
}
