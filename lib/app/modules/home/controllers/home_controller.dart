import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/surah_model.dart';

class HomeController extends GetxController {
  Future<List<SurahModel>> getAllSurah() async {
    Uri url = Uri.parse("https://api.quran.sutanlab.id/surah");
    var response = await http.get(url).timeout(Duration(seconds: 30));
    print(response);

    List data = (json.decode(response.body) as Map<String, dynamic>)["data"];

    if (data.isEmpty) {
      return [];
    }

    return data.map((e) => SurahModel.fromJson(e)).toList();
  }
}
