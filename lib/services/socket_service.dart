import 'package:chat/models/chatMessage/chat_message.dart';
import 'package:chat/models/socket_event.dart';
import 'package:chat/routes/pages.dart';
import 'package:chat/services/user_service.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketService extends GetxService {
  static SocketService get to => Get.find();
  late Socket _socket;
  Future<SocketService> init() async {
    _socket = io(
      'https://masqed.ru',
      OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setPath('/chat/socket.io')
          .disableReconnection()
          .build(),
    );

    _socket.onConnect((data) {
      printInfo(info: "Socket connected");
      _sendLogInMesssage();
      Get.offNamed(Routes.CHAT);
    });

    _socket.onDisconnect((data) {
      printInfo(info: "Disconnected");
      UserService.to.clearMessage();
      Get.offNamed(Routes.HOME);
    });

    _socket.onConnectError((data) => printInfo(info: "Connection error"));

    _socket.onAny((event, data) { 
      var isKnown = SocketEvent.values.any((el) => el.name == event); 
      if (!isKnown) return; 
      data['type'] = event; 
      var message = ChatMessage.fromJson(data); 
      UserService.to.addMessageToList(message); 
    }); 

    return this;
  }

  void connect() {
    _socket.connect();
  }

  void disconnect() {
    _socket.disconnect();
  }

  void _sendLogInMesssage() {
    _socket.emit(SocketEvent.login.name, UserService.to.username);
  }

  void _sendLogOutMesssage() {
    _socket.emit(SocketEvent.logout.name);
  }

}
