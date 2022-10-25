import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final String src =
      "https://images.unsplash.com/photo-1662414590066-91c548626702?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halo Huy"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 50, color: Color.fromARGB(1000, 210, 90, 155)),
              ),
              Text(
                "Lu qua di",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Image.network(src),
              Image.asset("assets/images/nha.jpg"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("helloooo");
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Icon(Icons.home),
      ),
    );
  }
}
