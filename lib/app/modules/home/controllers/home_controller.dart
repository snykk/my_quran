import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/surah_model.dart';

class HomeController extends GetxController {
  RxBool isDark = false.obs;

  Future<List<SurahModel>> getAllSurah() async {
    var response = await http
        .get(Uri.parse("https://api.quran.sutanlab.id/surah"))
        .timeout(Duration(seconds: 30));

    List data = (json.decode(response.body) as Map<String, dynamic>)["data"];

    if (data.isEmpty) {
      return [];
    }

    return data.map((e) => SurahModel.fromJson(e)).toList();
  }
}
