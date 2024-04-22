import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await initServices();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.HOME,
    getPages: AppPages.pages,
  ));
}

Future<void> initServices() async {}
