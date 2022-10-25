import 'package:flutter/material.dart';
import 'package:flutter_application_1/japan_food_page.dart';
import 'package:flutter_application_1/signIn.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

// Future<User> fetchUser() async {
//   final response =
//       await http.get(Uri.parse('https://fakestoreapi.com/auth/login'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return User.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to login');
//   }
// }

// class User {
//   final String username;
//   final String password;

//   const User({
//     required this.username,
//     required this.password,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       username: json['username'],
//       password: json['password'],
//     );
//   }
// }
void Login(BuildContext context, String userName, String passWord) async {
  var url = 'https://fakestoreapi.com/auth/login';
  Map data = {
    'username': userName,
    'password': passWord,
  };
  // print(userName);
  // print(passWord);
  var response = await http.post(Uri.parse(url), body: data);
  if (response.statusCode == 200) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => JapanFood()));
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Đăng nhập thất bại!")));
  }
  // return Future<bool>.value(false);
}

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var _formKey = GlobalKey<FormState>();
  var _formUserName = GlobalKey<FormState>();
  var _formPass = GlobalKey<FormState>();

  final TextEditingController _userName = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  // late Future<User> checkUser;
  //@override
  // void initState() {
  //   super.initState();
  //   checkUser = fetchUser();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300,
                  child: Image.asset(
                    "assets/images/evn.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 400,
                  child: TextFormField(
                    controller: _userName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Vui lòng nhập tên đăng nhập";
                      } else if (value.length <= 5) {
                        return "Tên đăng nhập quá ngắn";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100.0),
                        ),
                      ),
                      label: Text(
                        "Tên đằng xuất",
                        style: TextStyle(color: Colors.red),
                      ),
                      hintText: "Vui lòng nhập tên đăng xuất",
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 400,
                  child: TextFormField(
                    controller: _pass,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Vui lòng nhập mật khẩu";
                      } else if (value.length <= 5) {
                        return "Mật khẩu không đúng";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100.0),
                        ),
                      ),
                      label:
                          Text("Mật khẩu", style: TextStyle(color: Colors.red)),
                      hintText: "Vui lòng nhập mật khẩu",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 400, height: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //Form okk
                        Login(context, _userName.text.toString(),
                            _pass.text.toString());
                      } else {
                        //Form deo ổn
                      }
                    },
                    child: const Text(
                      "Đăng nhập",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), primary: Colors.blue),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 400, height: 50),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    },
                    child: const Text(
                      "Đăng ký",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), primary: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
