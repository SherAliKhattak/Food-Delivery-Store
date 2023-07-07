import 'package:store_app/models/item_model.dart';

class CategoryModel{
  String? id;
  String? name;
  List<ItemModel>? items;

  CategoryModel({this.id, this.name, this.items});

    CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['items'] != null) {
      items = <ItemModel>[];
      json['towns'].forEach((v) {
        items!.add(ItemModel.fromJson(json: v));
      });
    }
  
  }
}