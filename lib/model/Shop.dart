import 'package:flutter_application_1/model/shop_Rating.dart';

class StoreModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? imageProduct;
  RatingModel? rating;
  int quantity;

  StoreModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.imageProduct,
      this.rating,
      this.quantity = 0});
  factory StoreModel.fromJson(Map<String, dynamic> obj) {
    return StoreModel(
      id: obj['id'],
      title: obj['title'],
      price: obj['price'],
      description: obj['description'],
      category: obj['category'],
      imageProduct: obj['image'],
      rating: RatingModel.fromJson(obj['rating']),
      //publishedAt: obj['publishedAt'],
    );
  }
  factory StoreModel.fromItem(StoreModel item, int quantity) {
    return StoreModel(
      id: item.id,
      title: item.title,
      description: item.description,
      price: item.price,
      category: item.category,
      imageProduct: item.imageProduct,
      rating: item.rating,
      quantity: quantity,
    );
  }
}
