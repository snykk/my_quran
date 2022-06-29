import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/surah.dart';

class HomeController extends GetxController {
  Future<List<SurahModel>> getAllSurah() async {
    Uri url = Uri.parse("https://api.quran.sutanlab.id/surah");
    var res = await http.get(url);

    List data = (json.decode(res.body) as Map<String, dynamic>)["data"];

    if (data.isEmpty) {
      return [];
    }

    return data.map((e) => SurahModel.fromJson(e)).toList();
  }
}
