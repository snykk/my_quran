import 'package:get/get.dart';

import 'package:my_quran/app/modules/detail_surah/bindings/detail_surah_binding.dart';
import 'package:my_quran/app/modules/detail_surah/views/detail_surah_view.dart';
import 'package:my_quran/app/modules/home/bindings/home_binding.dart';
import 'package:my_quran/app/modules/home/views/home_view.dart';
import 'package:my_quran/app/modules/introduction/bindings/introduction_binding.dart';
import 'package:my_quran/app/modules/introduction/views/introduction_view.dart';
import 'package:my_quran/app/modules/last_read/bindings/last_read_binding.dart';
import 'package:my_quran/app/modules/last_read/views/last_read_view.dart';
import 'package:my_quran/app/modules/search/bindings/search_binding.dart';
import 'package:my_quran/app/modules/search/views/search_view.dart';

// ignore_for_file: constant_identifier_names

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
    GetPage(
      name: _Paths.DETAIL_SURAH,
      page: () => DetailSurahView(),
      binding: DetailSurahBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.LAST_READ,
      page: () => LastReadView(),
      binding: LastReadBinding(),
    ),
  ];
}
