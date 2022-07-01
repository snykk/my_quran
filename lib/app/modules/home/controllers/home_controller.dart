import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/surah_model.dart';

class HomeController extends GetxController {
  RxBool isDark = false.obs;
  List<SurahModel> allSurahData = [];

  Map<String, Map<String, String>> juzData = {
    "juz 1": {
      "mulai": "Al-Fatihah - 1",
      "selesai": "Al-Baqarah - 141",
    },
    "juz 2": {
      "mulai": "Al-Baqarah - 142",
      "selesai": "Al-Baqarah - 252",
    },
    "juz 3": {
      "mulai": "Al-Baqarah - 253",
      "selesai": "Ali 'Imran - 92",
    },
    "juz 4": {
      "mulai": "Ali 'Imran - 93",
      "selesai": "An-Nisa' - 23",
    },
    "juz 5": {
      "mulai": "An-Nisa' - 24",
      "selesai": "An-Nisa' - 147",
    },
    "juz 6": {
      "mulai": "An-Nisa' - 148",
      "selesai": "Al-Ma'idah - 81",
    },
    "juz 7": {
      "mulai": "Al-Ma'idah - 82",
      "selesai": "Al-An'am - 110",
    },
    "juz 8": {
      "mulai": "Al-An'am - 111",
      "selesai": "Al-A'raf - 87",
    },
    "juz 9": {
      "mulai": "Al-A'raf - 88",
      "selesai": "Al-Anfal - 40",
    },
    "juz 10": {
      "mulai": "Al-Anfal - 41",
      "selesai": "At-Taubah - 92",
    },
    "juz 11": {
      "mulai": "At-Taubah - 93",
      "selesai": "Hud - 5",
    },
    "juz 12": {
      "mulai": "Hud - 6",
      "selesai": "Yusuf - 52",
    },
    "juz 13": {
      "mulai": "Yusuf - 53",
      "selesai": "Ibrahim - 52",
    },
    "juz 14": {
      "mulai": "Al-Hijr - 1",
      "selesai": "An-Nahl - 128",
    },
    "juz 15": {
      "mulai": "Al-Isra' - 1",
      "selesai": "Al-Kahf - 74",
    },
    "juz 16": {
      "mulai": "Al-Kahf - 75",
      "selesai": "Taha - 135",
    },
    "juz 17": {
      "mulai": "Al-Anbiya' - 1",
      "selesai": "Al-Hajj - 78",
    },
    "juz 18": {
      "mulai": "Al-Mu'minun - 1",
      "selesai": "Al-Furqan - 20",
    },
    "juz 19": {
      "mulai": "Al-Furqan - 21",
      "selesai": "An-Naml - 55",
    },
    "juz 20": {
      "mulai": "An-Naml - 56",
      "selesai": "Al-'Ankabut - 45",
    },
    "juz 21": {
      "mulai": "Al-'Ankabut - 46",
      "selesai": "Al-Ahzab - 30",
    },
    "juz 22": {
      "mulai": "Al-Ahzab - 31",
      "selesai": "Yasin - 27",
    },
    "juz 23": {
      "mulai": "Yasin - 28",
      "selesai": "Az-Zumar - 31",
    },
    "juz 24": {
      "mulai": "Az-Zumar - 32",
      "selesai": "Fussilat - 46",
    },
    "juz 25": {
      "mulai": "Fussilat - 47",
      "selesai": "Al-Jasiyah - 37",
    },
    "juz 26": {
      "mulai": "Al-Ahqaf - 1",
      "selesai": "Az-Zariyat - 30",
    },
    "juz 27": {
      "mulai": "Az-Zariyat - 31",
      "selesai": "Al-Hadid - 29",
    },
    "juz 28": {
      "mulai": "Al-Mujadalah - 1",
      "selesai": "At-Tahrim - 12",
    },
    "juz 29": {
      "mulai": "Al-Mulk - 1",
      "selesai": "Al-Mursalat - 50",
    },
    "juz 30": {
      "mulai": "An-Naba' - 1",
      "selesai": "An-Nas - 6",
    },
  };

  Future<List<SurahModel>> getAllSurah() async {
    var response = await http
        .get(Uri.parse("https://api.quran.sutanlab.id/surah"))
        .timeout(Duration(seconds: 30));

    List data = (json.decode(response.body) as Map<String, dynamic>)["data"];

    if (data.isEmpty) {
      return [];
    }

    allSurahData = data.map((e) => SurahModel.fromJson(e)).toList();
    return allSurahData;
  }
}
