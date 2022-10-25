import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FoodPage extends StatefulWidget {
  FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  List<String> _list = [
    'assets/images/nuituyet.jpg',
    'assets/images/vuc.jpg',
    'assets/images/thaonguyen.jpg',
    'assets/images/oes.jpg',
  ];

  bool showGrid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle(context),
              SizedBox(
                height: 20,
              ),
              buildWelcome(context),
              SizedBox(
                height: 20,
              ),
              buildSearch(context),
              SizedBox(
                height: 30,
              ),
              buildSavePlace(context),
              SizedBox(
                height: 20,
              ),
              // buildGrid(context)
              showGrid ? buildGrid(context) : buildList(context)
            ],
          ),
        ),
      ),
    );
  }

  buildTitle(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.extension),
          ),
        ],
      ),
    );
  }

  buildWelcome(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Welcome,",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              "Charlie",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),
            )
          ]),
    );
  }

  buildSearch(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )),
    );
  }

  buildSavePlace(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Saved Places",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    showGrid = true;
                  });
                },
                icon: Icon(Icons.grid_3x3)),
            IconButton(
                onPressed: () {
                  setState(() {
                    showGrid = false;
                  });
                },
                icon: Icon(Icons.list)),
          ],
        )
      ],
    );
  }

  buildGrid(BuildContext context) {
    return Expanded(
      child: GridView.count(
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        crossAxisCount: 2,
        children: [
          ..._list.map((e) {
            return Container(
              // margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(e),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }).toList()
        ],
      ),
    );
  }

  buildList(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ..._list.map((e) {
            return Container(
              margin: EdgeInsets.all(10),
              height: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(e),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
