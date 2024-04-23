import 'package:chat/models/socket_event.dart';
import 'package:chat/modules/chat/widgets/bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_controller.dart';

class ChatPage extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Чат'),
          leading: IconButton(
              onPressed: () {
                controller.disconnect();
              },
              icon: const Icon(Icons.arrow_back)),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body: Column(
          children: [
            Expanded(
                child: Obx(() => ListView.builder(
                    controller: controller.scrollCtrl,
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      var message = controller.messages[index];
                      var itsMe = controller.itsMe(message.clientId);
                      switch (message.type) {
                        case SocketEvent.login:
                          return Center(
                              child: Text(
                            "${message.username} присоединился(ась) к чату",
                            style: const TextStyle(
                                fontSize: 13.0, color: Colors.grey),
                          ));
                        case SocketEvent.newMessage:
                          return BubbleMessage(message: message, itsMe: itsMe);
                        case SocketEvent.logout:
                          return Center(
                              child: Text(
                            "${message.username} покинул(а) чат",
                            style: const TextStyle(
                                fontSize: 13.0, color: Colors.grey),
                          ));
                        default:
                          return const SizedBox();
                      }
                    }))),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: TextFormField(
                focusNode: controller.focusNode,
                style: const TextStyle(color: Color.fromARGB(255, 25, 27, 33)),
                controller: controller.textCtrl,
                onFieldSubmitted: (value) {
                  controller.sendMessage();
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        controller.sendMessage();
                      },
                      icon: const Icon(Icons.send)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 129, 152, 255),
                      )),
                ),
              ),
            ),
          ],
        ));
  }
}
