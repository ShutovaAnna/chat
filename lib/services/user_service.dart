import 'package:chat/models/chatMessage/chat_message.dart';
import 'package:chat/services/socket_service.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

  String username = "";
  final messages = RxList<ChatMessage>.empty();

  Future<UserService> init() async {
    return this;
  }

  void setUsernameAndConnect(String user) {
    username = user;
    SocketService.to.connect();
  }

  void addMessageToList(ChatMessage message) {
    messages.add(message);
  }

  void clearMessage() {
    messages.clear();
  }
}
