import 'package:chat/services/socket_service.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

  String username = "";
  RxList messages = [].obs;

  Future<UserService> init() async {
    return this;
  }

  void setUsernameAndConnect(String user) {
    username = user;
    SocketService.to.connect();
  }
}
