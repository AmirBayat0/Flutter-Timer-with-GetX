import 'package:get/get.dart';
import '../controller/theme_controller.dart';
import '../controller/timer_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TimerController());
    Get.lazyPut(() => ThemeController());
  }
}
