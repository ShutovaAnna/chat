import 'package:chat/modules/chat/chat_binding.dart';
import 'package:chat/modules/chat/chat_page.dart';
import 'package:chat/modules/home/home_binding.dart';
import 'package:chat/modules/home/home_page.dart';
import 'package:get/get.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.CHAT,
      page: () => ChatPage(),
      binding: ChatBinding(),
    ),
  ];
}
