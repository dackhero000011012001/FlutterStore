import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GenreSlider extends StatefulWidget {
  GenreSlider({super.key});

  @override
  State<GenreSlider> createState() => _GenreSliderState();
}

class _GenreSliderState extends State<GenreSlider> {
  List<String> _list = [
    'Tất cả',
    'Phong cảnh',
    'Ảnh nền',
    'Kiến trúc',
    'Nhà cửa',
    'Cây cảnh',
    'Game',
    'Anime',
    'Mô tô',
  ];
  String genreSlected = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ..._list.map((e) {
              return InkWell(
                onTap: () {
                  setState(() {
                    genreSlected = e;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: new EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: (genreSlected == e ? Colors.black : Colors.green),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color: (genreSlected == e
                              ? Colors.green
                              : Colors.transparent),
                          width: 2.0)),
                  child: Text(
                    e,
                    style: TextStyle(
                        fontSize: 15,
                        color:
                            (genreSlected == e ? Colors.green : Colors.white)),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
