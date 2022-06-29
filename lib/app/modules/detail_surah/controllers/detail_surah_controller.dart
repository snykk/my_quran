import 'dart:convert';

import 'package:get/get.dart';
import '../../../data/models/detail_surah_model.dart';
import 'package:http/http.dart' as http;

class DetailSurahController extends GetxController {
  Future<DetailSurahModel> getDetailSurah(String id) async {
    print(id);
    Uri url = Uri.parse("https://api.quran.sutanlab.id/surah/$id");
    print(url);
    var response = await http.get(url);
    print("hallo aja");

    Map<String, dynamic> data = (json.decode(response.body) as Map<String, dynamic>)["data"];

    print("hallo");
    print(data);

    DetailSurahModel detailSurahModel = DetailSurahModel.fromJson(data);

    print("ini detail surah $detailSurahModel");

    return detailSurahModel;
  }
}
