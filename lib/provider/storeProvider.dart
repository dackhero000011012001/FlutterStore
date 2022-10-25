import 'dart:convert';
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Model/Shop.dart';
import 'package:http/http.dart' as http;

class StoreProvider extends ChangeNotifier {
  List<StoreModel> list = [];
  List<dynamic> category = [];
  void getList() async {
    String apiURL = "https://fakestoreapi.com/products";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(jsonString.body);
    var newsListObject = jsonObject as List;
    list = newsListObject.map((e) {
      return StoreModel.fromJson(e);
    }).toList();
    notifyListeners();
  }

  void getListCategory() async {
    String apiURL = "https://fakestoreapi.com/products/categories";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(jsonString.body);
    var newsListObject = jsonObject as List;
    category = newsListObject;
    notifyListeners();
  }

  void getCategoryProduct(categoryId) async {
    String apiURL = "https://fakestoreapi.com/products/category/$categoryId";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(jsonString.body);
    var newsListObject = jsonObject as List;

    list = newsListObject.map((e) {
      return StoreModel.fromJson(e);
    }).toList();
    notifyListeners();
  }
}
