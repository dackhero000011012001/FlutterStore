import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class SlideImage extends StatelessWidget {
  SlideImage({super.key});
  List<String> _list = [
    'assets/images/nuituyet.jpg',
    'assets/images/vuc.jpg',
    'assets/images/thaonguyen.jpg',
    'assets/images/oes.jpg',
    'assets/images/nui.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ..._list.map((e) {
              return Container(
                margin: EdgeInsets.all(20),
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(e), fit: BoxFit.cover)),
              );
            })
          ],
        ),
      ),
    );
  }
}
