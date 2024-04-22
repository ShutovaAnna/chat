import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_controller.dart';

class ChatPage extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Чат')),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      var message = controller.messages[index];
                      return Text("${message.username} ${message.message}");
                    })),
            Container(
              height: 50,
              color: Color.fromARGB(255, 204, 239, 249),
            )
          ],
        ));
  }
}
