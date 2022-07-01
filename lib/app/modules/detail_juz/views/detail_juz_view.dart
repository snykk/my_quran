import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_quran/app/data/models/surah_model.dart';

import '../../../constants/palettes.dart';
import '../../../constants/ratio.dart';
import '../controllers/detail_juz_controller.dart';
import '../../../data/models/juz_model.dart' as juz;

class DetailJuzView extends GetView<DetailJuzController> {
  final int numberJuz = Get.arguments['numberJuz'];
  final List<SurahModel> surahInJuz = Get.arguments['surahInJuz'];

  @override
  Widget build(BuildContext context) {
    controller.indexSurah = -1;

    return Scaffold(
      appBar: AppBar(
        title: Text('DetailJuzView'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          FutureBuilder<juz.JuzModel>(
            future: controller.getDetailJuz(numberJuz.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  children: [
                    SizedBox(height: Ratio(context).heightApp * 0.3),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              }

              if (!snapshot.hasData) {
                return Center(
                  child: Text("Tidak ada data"),
                );
              }

              juz.JuzModel? detailJuz = snapshot.data!;

              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: detailJuz.verses!.length,
                itemBuilder: (context, index) {
                  juz.Verse? ayat = snapshot.data?.verses?[index];

                  if (ayat!.number!.inSurah == 1) {
                    controller.indexSurah += 1;
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MyPalettes.appPurpleLight2.withOpacity(0.2),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "assets/logo/index_element_${Get.isDarkMode ? 'dark' : 'light'}.png",
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text("${ayat.number!.inSurah}"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "${surahInJuz[controller.indexSurah].name!.transliteration!.id}",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.bookmark),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.play_arrow),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: Ratio(context).widthApp,
                        child: Text(
                          "${ayat.text?.arab}",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${ayat.text?.transliteration?.en}",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "${ayat.translation!.id}",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
