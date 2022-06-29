import 'dart:convert';

import 'package:get/get.dart';
import '../../../data/models/detail_surah.dart';
import 'package:http/http.dart' as http;

class DetailSurahController extends GetxController {
  Future<DetailSurahModel> getDetailSurah(String id) async {
    Uri url = Uri.parse("https://api.quran.sutanlab.id/surah/$id");
    var response = await http.get(url);

    Map<String, dynamic> data = (json.decode(response.body) as Map<String, dynamic>)["data"];

    return DetailSurahModel.fromJson(data);
  }
}
