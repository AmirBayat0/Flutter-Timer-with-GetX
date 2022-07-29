import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/theme_controller.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onTap,
    required this.color,
    required this.fontWeight,
  }) : super(key: key);
  final String text;
  final Color color;
  final VoidCallback onTap;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    var themeController = Get.find<ThemeController>();

    return GestureDetector(
      onTap: onTap,
      child: GetBuilder<ThemeController>(
          id: 1,
          builder: (context) {
            return Container(
              width: Get.width / 5,
              height: Get.height / 14,
              decoration: BoxDecoration(
                  color: themeController.isDarkMode
                      ? const Color.fromARGB(255, 21, 21, 21)
                      : Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10.0,
                        offset: const Offset(5, 5),
                        color: themeController.isDarkMode
                            ? Colors.black
                            : const Color.fromARGB(109, 144, 144, 144)),
                    BoxShadow(
                        blurRadius: 10.0,
                        offset: const Offset(-5, -5),
                        color: themeController.isDarkMode
                            ? const Color.fromARGB(255, 27, 27, 27)
                            : const Color.fromARGB(255, 243, 243, 243))
                  ],
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: color,
                    fontSize: 19,
                    fontWeight: fontWeight,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
