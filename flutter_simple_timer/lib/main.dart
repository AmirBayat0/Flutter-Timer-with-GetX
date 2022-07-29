//CodeWithFlexz on Instagram

//AmirBayat0 on Github
//Programming with Flexz on Youtube

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
//
import '../bindings.dart';
import '../utils/themes.dart';
import 'view/final_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MyBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Simple Timer',
      darkTheme: MyThemes.darkTheme,
      themeMode: ThemeMode.light,
      theme: MyThemes.lightTheme,
      home: const FinalView(),
    );
  }
}







































