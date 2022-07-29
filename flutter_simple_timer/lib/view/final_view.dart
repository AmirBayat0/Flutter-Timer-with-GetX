import 'package:flutter/material.dart';
import 'package:get/get.dart';

//
import '../components/buttons.dart';
import '../controller/theme_controller.dart';
import '../controller/timer_controller.dart';

class FinalView extends StatelessWidget {
  const FinalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timerController = Get.find<TimerController>();
    var themeController = Get.find<ThemeController>();
    // var textTheme = Theme.of(context).textTheme;
    // var iconTheme = Theme.of(context).iconTheme;

    return Scaffold(
      appBar: const MyAppBar(),
      body: Container(
        margin: const EdgeInsets.all(10),
        width: Get.width,
        height: Get.height,
        child: GetBuilder<TimerController>(
            init: TimerController(),
            builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Center Circle
                  GetBuilder<ThemeController>(
                      id: 1,
                      builder: (context) {
                        return Container(
                          decoration: BoxDecoration(
                            color: themeController.isDarkMode
                                ? const Color.fromARGB(255, 21, 21, 21)
                                : Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10.0,
                                  offset: const Offset(5, 5),
                                  color: themeController.isDarkMode
                                      ? Colors.black
                                      : const Color.fromARGB(
                                          109, 144, 144, 144)),
                              BoxShadow(
                                  blurRadius: 10.0,
                                  offset: const Offset(-5, -5),
                                  color: themeController.isDarkMode
                                      ? const Color.fromARGB(255, 27, 27, 27)
                                      : const Color.fromARGB(
                                          255, 243, 243, 243))
                            ],
                          ),
                          width: 300,
                          height: 300,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: CircularProgressIndicator(
                                  strokeWidth: 12,
                                  valueColor: AlwaysStoppedAnimation(
                                      timerController.seconds == 60
                                          ? Colors.green
                                          : Colors.red),
                                  backgroundColor: themeController.isDarkMode
                                      ? const Color.fromARGB(255, 34, 34, 34)
                                      : const Color.fromARGB(
                                          255, 237, 237, 237),
                                  value: timerController.seconds /
                                      TimerController.maxSeconds,
                                ),
                              ),
                              Center(
                                child: Text(
                                  timerController.seconds.toString(),
                                  style: TextStyle(
                                    fontSize: 100,
                                    fontWeight: FontWeight.bold,
                                    color: timerController.isCompleted()
                                        ? const Color.fromARGB(255, 8, 123, 12)
                                        : const Color.fromARGB(255, 178, 14, 2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 50,
                  ),

                  /// Buttons
                  timerController.isTimerRuning() ||
                          !timerController.isCompleted()
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ButtonWidget(
                                onTap: () {
                                  timerController.isTimerRuning()
                                      ? timerController.stopTimer(rest: false)
                                      : timerController.startTimer(rest: false);
                                },
                                text: timerController.isTimerRuning()
                                    ? "Pause"
                                    : "Resume",
                                color: timerController.isTimerRuning()
                                    ? Colors.red
                                    : Colors.green,
                                fontWeight: FontWeight.w400),
                            ButtonWidget(
                                onTap: () {
                                  timerController.stopTimer(rest: true);
                                },
                                text: "Cancel",
                                color: Colors.red,
                                fontWeight: FontWeight.w600)
                          ],
                        )
                      : GetBuilder<ThemeController>(
                          init: ThemeController(),
                          id: 1,
                          initState: (_) {},
                          builder: (_) {
                            return ButtonWidget(
                              onTap: () {
                                timerController.startTimer();
                              },
                              text: "Start",
                              color: themeController.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w400,
                            );
                          },
                        ),
                ],
              );
            }),
      ),
    );
  }
}

/// MyApp Bar
class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeController = Get.find<ThemeController>();
    var textTheme = Theme.of(context).textTheme;
    var iconTheme = Theme.of(context).iconTheme;
    return AppBar(
      title: Text("Timer", style: textTheme.headline1),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        GetBuilder<ThemeController>(
          init: ThemeController(),
          id: 1,
          initState: (_) {},
          builder: (_) {
            return IconButton(
                onPressed: () {
                  themeController.changeThemeOfButtons();
                  themeController.isDarkMode
                      ? Get.changeThemeMode(ThemeMode.dark)
                      : Get.changeThemeMode(ThemeMode.light);
                },
                icon: Icon(
                  themeController.isDarkMode
                      ? Icons.light_mode
                      : Icons.dark_mode,
                  color: iconTheme.color,
                  size: iconTheme.size,
                ));
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
