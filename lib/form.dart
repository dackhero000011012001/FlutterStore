import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vui lòng nhập tên đăng nhập";
                  } else if (value.length <= 5) {
                    return "Tên đăng nhập quá ngắn";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  label: Text("Tên đằng xuất"),
                  hintText: "Vui lòng nhập tên đăng xuất",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //Form okk
                  } else {
                    //Form deo ổn
                  }
                },
                child: const Text("Okkie"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
