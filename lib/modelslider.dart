import 'package:flutter/material.dart';
import 'package:flutter_application_1/DesModel.dart';

class ModelSlider extends StatefulWidget {
  ModelSlider({super.key});

  @override
  State<ModelSlider> createState() => _ModelSliderState();
}

class _ModelSliderState extends State<ModelSlider> {
  final List<DesModel> _list = DesModel.MockData();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ..._list.map((e) {
              return Container(
                margin: EdgeInsets.all(65),
                height: 300,
                width: MediaQuery.of(context).size.width * 0.65,
                // width: 240,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(e.image), fit: BoxFit.cover)),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(children: [
                    Text(
                      e.name,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Container(
                      margin: EdgeInsets.all(50),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.black,
                          ),
                          Text(
                            e.rating,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
