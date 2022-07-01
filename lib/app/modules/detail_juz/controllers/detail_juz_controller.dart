import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/juz_model.dart';

class DetailJuzController extends GetxController {
  late int indexSurah;
  Future<JuzModel> getDetailJuz(String id) async {
    var response = await http.get(Uri.parse("https://api.quran.sutanlab.id/juz/$id"));

    Map<String, dynamic> data = (json.decode(response.body) as Map<String, dynamic>)["data"];

    JuzModel juzData = JuzModel.fromJson(data);

    return juzData;
  }
}
