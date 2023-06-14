import 'package:flutter/material.dart';
import 'package:test_app/products/product_screen.dart';
import 'package:test_app/todo/todo_screen.dart';
import 'package:test_app/users/user_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../checkbox/cubit_checkbox/check_box_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("homePage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductScreen()));
                  },
                  child: const Text("Go to ProductScreen"))),
          20.heightBox,
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserScreen()));
                  },
                  child: const Text("Go to UsersScreen"))),
          20.heightBox,
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TodoScreen()));
                  },
                  child: const Text("Go to TodoScreen"))),
          20.heightBox,
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyCheckBoxPage1()));
                  },
                  child: const Text("Go to PostScreen"))),
        ],
      ),
    );
  }
}
