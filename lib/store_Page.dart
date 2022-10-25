import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottomBar.dart';
import 'package:flutter_application_1/categoriesProduct.dart';
import 'package:flutter_application_1/model/SearchProduct.dart';
import 'package:flutter_application_1/model/shop_Rating.dart';
import 'package:flutter_application_1/productDetail.dart';
import 'package:flutter_application_1/provider/storeProvider.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  var storeProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storeProvider = Provider.of<StoreProvider>(context, listen: false);
    storeProvider.getList();
  }

  @override
  Widget build(BuildContext context) {
    int cateSlected = 0;
    final Function press;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'WELCOME',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  'FAKE Store API',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(241, 117, 50, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Color.fromRGBO(241, 117, 50, 1),
            ],
          ),
        ),
        child: SizedBox(
          height: 2940,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              SearchBox(),

              SizedBox(
                height: 10,
              ),
              CateProduct(),

              SizedBox(
                height: 20,
              ),
              // ignore: unnecessary_new
              Consumer<StoreProvider>(
                builder: ((context, value, child) {
                  return value.list.length == 0
                      ? Container()
                      : Expanded(
                          child: GridView.count(
                            // shrinkWrap: true,

                            scrollDirection: Axis.vertical,
                            // crossAxisSpacing: 15,
                            // mainAxisSpacing: 20,
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 20,
                            childAspectRatio: (2 / 3.2),
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 20, bottom: 20),
                            children: [
                              ...value.list.map((e) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 255, 255, 255)
                                            .withOpacity(1),
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                                255, 69, 69, 69)
                                            .withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 3,
                                        offset: const Offset(
                                            0, 4), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PDetails(
                                                        title: e.title ?? "",
                                                        category:
                                                            e.category ?? "",
                                                        description:
                                                            e.category ?? "",
                                                        price: e.price ?? 0,
                                                        rating: e.rating ??
                                                            RatingModel(),
                                                        imageLink:
                                                            e.imageProduct ??
                                                                "",
                                                      )));
                                        },
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              children: [
                                                Image.network(
                                                  e.imageProduct ?? "",
                                                  width: 60,
                                                  height: 100,
                                                  fit: BoxFit.scaleDown,
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    // Navigator.push(
                                                    //   context,
                                                    //   MaterialPageRoute(builder: (context) => NewsInfo()),
                                                    // );
                                                  },
                                                  child: Text(
                                                    e.title ?? "",
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromARGB(
                                                          255, 69, 69, 69),
                                                    ),
                                                    softWrap: false,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    RatingBar.builder(
                                                      initialRating:
                                                          e.rating?.rate ?? 5.0,
                                                      minRating: 0.1,
                                                      direction:
                                                          Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      itemSize: 10,
                                                      itemPadding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              horizontal: 1.0),
                                                      itemBuilder:
                                                          (context, _) =>
                                                              const Icon(
                                                        Icons.star,
                                                        size: 5,
                                                        color: Colors.amber,
                                                      ),
                                                      onRatingUpdate: (rating) {
                                                        print(rating);
                                                      },
                                                    ),
                                                    Text(
                                                      (e.rating?.count ?? 0.0)
                                                              .toString() +
                                                          " ratings",
                                                      // ignore: prefer_const_constructors
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 69, 69, 69),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Icon(
                                                          Icons.attach_money,
                                                          size: 16,
                                                        ),
                                                        Text(
                                                          (e.price ?? "")
                                                              .toString(),
                                                          // ignore: prefer_const_constructors
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                69,
                                                                69,
                                                                69),
                                                          ),
                                                          softWrap: true,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                    ConstrainedBox(
                                                      constraints:
                                                          const BoxConstraints
                                                                  .tightFor(
                                                              width: 60,
                                                              height: 40),
                                                      child: ElevatedButton(
                                                        onPressed: () {},
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shape:
                                                              const StadiumBorder(),
                                                          primary: const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  255)
                                                              .withOpacity(0.9),
                                                        ),
                                                        child: const Icon(
                                                          Icons
                                                              .add_shopping_cart,
                                                          size: 24,
                                                          color: Color.fromARGB(
                                                              255, 69, 69, 69),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList()
                            ],
                          ),
                        );
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => StorePage()));
        },
        backgroundColor: Color.fromRGBO(241, 117, 50, 1),
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
