import 'package:flutter/material.dart';

import 'package:flutter_application_1/provider/storeProvider.dart';

import 'package:flutter_application_1/store_Page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    //   MaterialApp(
    //   // home: Camp(),
    //   // home: FoodPage(),
    //   // home: JapanFood(),
    //   // home: LoginPage(),
    //   //home: LoginScreen(),
    //   debugShowCheckedModeBanner: false,

    // ),
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => StoreProvider())],
      child: MaterialApp(
        home: StorePage(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
