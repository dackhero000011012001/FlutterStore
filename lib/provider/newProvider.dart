import 'dart:convert';
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Model/Tesla.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class NewsProvider extends ChangeNotifier {
  List<NewsModel> list = [];
  void getList() async {
    String apiURL =
        "https://newsapi.org/v2/everything?q=tesla&from=2022-09-18&sortBy=publishedAt&apiKey=891c5d17ccf84769939d262d19aacaed";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiURL));
    var jsonObject = jsonDecode(jsonString.body);
    var newsListObject = jsonObject['articles'] as List;
    list = newsListObject.map((e) {
      return NewsModel.fromJson(e);
    }).toList();
    notifyListeners();
  }
}
