import 'package:get/get.dart';

class AuthController extends GetxController {
  final _username = RxString('');

  set username(String name) {
    _username.value = name;
  }

  RxString get reactiveName => _username;
  String get name => _username.value;
}
