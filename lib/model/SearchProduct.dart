import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (text) {
          print('First text field: $text');
        },
        style: TextStyle(color: Color.fromARGB(255, 69, 69, 69)),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            size: 20,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 69, 69, 69).withOpacity(0.6)),
        ),
      ),
    );
  }
}
