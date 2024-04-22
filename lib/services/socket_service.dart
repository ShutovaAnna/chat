import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketService extends GetxService {
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

    _socket.onConnect((data) => printInfo(info: "Socket connected"));
    _socket.onDisconnect((data) => printInfo(info: "Disconected"));
    _socket.onConnectError((data) => printInfo(info: "Connection error"));
    _socket.onAny((event, data) => printInfo(info: "event: $event \t $data"));

    return this;
  }

  void connect() {
    _socket.connect();
  }

  void disconnect() {
    _socket.disconnect();
  }
}
