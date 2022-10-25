import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/Shop.dart';

class CartProvider extends ChangeNotifier {
  List<StoreModel> listProduct = [];
  // String urlApi = ''

  void add(StoreModel item, int quantity) {
    for (int i = 0; i < listProduct.length; i++) {
      if (listProduct[i].title == item.title) {
        listProduct[i].quantity = listProduct[i].quantity + quantity;
        notifyListeners();
        return;
      }
    }
    StoreModel product = StoreModel.fromItem(item, 1);
    listProduct.add(product);
    notifyListeners();
  }

  void remove(StoreModel item) {
    listProduct.remove(item);
    notifyListeners();
  }
}
