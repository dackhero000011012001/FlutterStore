import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottomBar.dart';
import 'package:flutter_application_1/model/Shop.dart';
import 'package:flutter_application_1/model/shop_Rating.dart';
import 'package:flutter_application_1/store_Page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PDetails extends StatelessWidget {
  const PDetails(
      {super.key,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.imageLink,
      required this.rating});
  // final StoreModel product;
  final String title;
  final double price;
  final String description;
  final String category;
  final String imageLink;
  final RatingModel rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StorePage(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 60, right: 60),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255).withOpacity(1),
                borderRadius: BorderRadius.circular(1000),
              ),
              child: Image.network(
                imageLink,
                height: 220,
                width: 100,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RatingBar.builder(
              initialRating: rating.rate ?? 0,
              minRating: 0.1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 18,
              itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                size: 5,
                color: Colors.yellow,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            Text(
              "${rating.count.toString()} rating",
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: const Color.fromARGB(255, 69, 69, 69),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 69, 69, 69),
              ),
            ),
            Text(
                "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday"),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.attach_money,
                  size: 21,
                ),
                Text(
                  price.toString(),
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 69, 69, 69),
                  ),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ConstrainedBox(
              constraints:
                  const BoxConstraints.tightFor(width: 280, height: 50),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  primary: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontSize: 21,
                        color: Color.fromARGB(255, 69, 69, 69),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.add_shopping_cart,
                      size: 24,
                      color: Color.fromARGB(255, 69, 69, 69),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => StorePage()));
        },
        backgroundColor: Color(0xFFF17532),
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
