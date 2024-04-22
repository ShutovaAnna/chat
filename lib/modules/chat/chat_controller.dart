import 'package:chat/models/chatMessage/chat_message.dart';
import 'package:chat/services/user_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  
  RxList<ChatMessage> get messages => UserService.to.messages;

  final textCtrl = TextEditingController();
  final scrollCtrl = ScrollController();
  final focusNode = FocusNode();

  @override
  void onInit() {
    messages.listen(
      (p0) async {
        if (scrollCtrl.hasClients) {
          var max = scrollCtrl.position.maxScrollExtent;
          if (scrollCtrl.offset + 100 >= max) {
            await Future.delayed(
              const Duration(milliseconds: 100),
              () {
                scrollCtrl.animateTo(scrollCtrl.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut);
              },
            );
          }
        }
      },
    );
    super.onInit();
  }


}
