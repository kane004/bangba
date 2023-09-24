import 'package:get/get.dart';

class UserController extends GetxController {
  final RxString userName = ''.obs; // 使用 Rx 包装状态

  void updateUser(String name) {
    userName.value = name; // 更新状态
  }
}
