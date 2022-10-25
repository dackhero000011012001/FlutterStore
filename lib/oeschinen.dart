import 'package:flutter/material.dart';
import 'package:flutter_application_1/genre_slider.dart';
import 'package:flutter_application_1/modelslider.dart';
import 'package:flutter_application_1/rowSlide.dart';

class Camp extends StatelessWidget {
  const Camp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SlideImage(),
            GenreSlider(),
            blockImage(),
            blockTitle(),
            blockActionButton(),
            blockContext(),
            ModelSlider(),
          ],
        ),
      ),
    );
  }

  blockImage() => Image.asset("assets/images/oes.jpg");

  blockTitle() {
    return Container(
      margin: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Oeschinen Lake Campground",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "Kandersteg, Sưitzerland",
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(100, 0, 0, 0),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.red,
              ),
              Text("48")
            ],
          )
        ],
      ),
    );
  }

  blockActionButton() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Icon(
                Icons.call,
                color: Colors.blue,
              ),
              Text(
                "CALL",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.send,
                color: Colors.blue,
              ),
              Text(
                "ROUTE",
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.share,
                color: Colors.blue,
              ),
              Text(
                "SHARE",
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
        ],
      ),
    );
  }

  blockContext() {
    return Container(
      margin: EdgeInsets.all(30),
      child: Text(
          "jkdajskdh ưuhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"),
    );
  }
}
