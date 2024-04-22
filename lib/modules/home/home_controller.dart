import 'package:chat/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final textCtrl = TextEditingController();

  void signIn() {
    String username = textCtrl.text;
    UserService.to.setUsernameAndConnect(username);
  }
}
