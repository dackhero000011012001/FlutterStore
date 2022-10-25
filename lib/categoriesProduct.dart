import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/provider/storeProvider.dart';
import 'package:provider/provider.dart';

class CateProduct extends StatefulWidget {
  const CateProduct({super.key});

  @override
  State<CateProduct> createState() => _CateProductState();
}

class _CateProductState extends State<CateProduct> {
  int cateSlected = -1;
  @override
  Widget build(BuildContext context) {
    var storeProvider = Provider.of<StoreProvider>(context);
    storeProvider.getListCategory();
    return Container(
      height: 60,
      child: ListView(
        padding: EdgeInsets.only(left: 20, right: 20),
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            child: GestureDetector(
              onTap: () {
                storeProvider.getList();
                setState(() {
                  cateSlected = -1;
                });
              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: -1 == cateSlected
                      ? Colors.white.withOpacity(0.6)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "All",
                  style: TextStyle(
                    color: Color.fromARGB(255, 69, 69, 69).withOpacity(1),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          ...storeProvider.category.asMap().entries.map((e) {
            return Container(
              child: GestureDetector(
                onTap: () {
                  storeProvider.getCategoryProduct(e.value);
                  setState(() {
                    cateSlected = e.key;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: e.key == cateSlected
                        ? Colors.white.withOpacity(0.6)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    e.value,
                    style: TextStyle(
                      color: Color.fromARGB(255, 69, 69, 69).withOpacity(1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }).toList()
        ],

        // GestureDetector(
        //   onTap: () {
        //     setState(() {
        //       cateSlected = index;
        //     });
        //   },
        //   child: Container(
        //     margin: EdgeInsets.all(10),
        //     padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        //     alignment: Alignment.center,
        //     decoration: BoxDecoration(
        //       color: index == cateSlected
        //           ? Colors.white.withOpacity(0.6)
        //           : Colors.transparent,
        //       borderRadius: BorderRadius.circular(12),
        //     ),
        //     child: Text(
        //       storeProvider.list.elementAt(index),
        //       style: TextStyle(
        //         color: Color.fromARGB(255, 69, 69, 69).withOpacity(1),
        //         fontSize: 16,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
