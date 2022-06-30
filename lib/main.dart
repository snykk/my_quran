import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_quran/app/constants/palettes.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: MyPalettes.appLightTheme,
      title: "My Qur'an",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
