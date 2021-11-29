import 'package:get/get.dart';

class ThemeController extends GetxController {
  // Using Rx<> for custom class reactivity
  //usa una variable reactiva que cambia y notifica cuando cambia.
  // del tema escogido
  final _isDarkMode = RxBool(false);

  // Setters
  set darkMode(bool mode) {
    _isDarkMode.value = mode;
  }

  // Reactive Getters
  //notifica cuando cambia
  RxBool get reactiveDarkMode => _isDarkMode;

  // Getters
  bool get darkMode => _isDarkMode.value;
}
