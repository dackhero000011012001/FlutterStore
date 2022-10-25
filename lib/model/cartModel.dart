import 'package:flutter_application_1/model/Shop.dart';

class CartModel {
  int? id;
  StoreModel? product;
  int count = 1;

  CartModel({this.id, this.product});
}
