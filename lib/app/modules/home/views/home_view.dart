import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_quran/app/data/models/surah_model.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surah'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<SurahModel>>(
        future: controller.getAllSurah(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData) {
            return Center(
              child: Text("Tidak ada data"),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              SurahModel surahData = snapshot.data![index];

              return ListTile(
                onTap: () {
                  Get.toNamed(Routes.DETAIL_SURAH, arguments: surahData);
                },
                leading: CircleAvatar(
                  child: Text("${surahData.number}"),
                ),
                title: Text(surahData.name?.transliteration?.id ?? 'missing data'),
                subtitle: Text(
                  "${surahData.numberOfVerses} Ayat | ${surahData.revelation?.id ?? 'missing data'}",
                ),
                trailing: Text(
                  surahData.name?.short ?? 'missing data',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
