import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool isDarkMode = Get.isDarkMode;

  void changeThemeOfButtons() {
    isDarkMode = !isDarkMode;
    update([1]);
  }
}
