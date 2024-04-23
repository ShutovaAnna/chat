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
          Text(
            "Укажите свой ник",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          TextField(
            controller: controller.textCtrl,
            onSubmitted: (value) => controller.signIn(),
            
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: const Color.fromARGB(124, 158, 158, 158),
            ),
          ),
        ],
      ),
    ));
  }
}
