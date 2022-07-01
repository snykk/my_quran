import 'package:get/get.dart';

import '../controllers/detail_juz_controller.dart';

class DetailJuzBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailJuzController>(
      () => DetailJuzController(),
    );
  }
}
