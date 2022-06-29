// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import 'package:my_quran/app/modules/home/bindings/home_binding.dart';
import 'package:my_quran/app/modules/home/views/home_view.dart';
import 'package:my_quran/app/modules/introduction/bindings/introduction_binding.dart';
import 'package:my_quran/app/modules/introduction/views/introduction_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INTRODUCTION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => IntroductionView(),
      binding: IntroductionBinding(),
    ),
  ];
}
