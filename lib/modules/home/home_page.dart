import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("укажите свой ник"),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Color.fromARGB(255, 158, 244, 255),
            ),
          ),
        ],
      ),
    ));
  }
}
