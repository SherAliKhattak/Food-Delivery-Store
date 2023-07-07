class ItemModel{
  String? itemID;
  String? itemName;
  String? itemImage;
  String? categoryID;
  String? storeID;
  String? itemPrice;
  String? category;

  ItemModel({this.itemID,this.itemName,this.itemImage,this.categoryID,this.storeID,this.itemPrice, this.category, });

  ItemModel.fromJson({json})
  {
    
    itemID = json['item_id'];
    itemName = json['item_name'];
    itemImage = json['item_Image'];
    categoryID = json['category_id'];
    storeID = json['storeID'];
    itemPrice = json['item_price'];
    category = json['category'];
  }

  toJson(){
    return{
      'item_id': itemID,
      'item_name': itemName,
      'item_Image': itemImage,
      'category_id': categoryID,
      'storeID': storeID,
      'item_price': itemPrice,
      'category': category
    };
  }
}