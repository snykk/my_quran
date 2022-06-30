import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_quran/app/constants/ratio.dart';
import 'package:my_quran/app/data/models/surah_model.dart';

import '../../../constants/palettes.dart';
import '../../../data/models/detail_surah_model.dart' as detail_surah;
import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  SurahModel surahData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('SURAH ${surahData.name?.transliteration?.id?.toUpperCase() ?? "missing data"}'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  MyPalettes.appPurpleLight1,
                  MyPalettes.appPurpleDark,
                ],
              ),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Get.dialog(
                    Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? MyPalettes.appPurpleDark.withOpacity(0.3)
                              : MyPalettes.appWhite,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Tafsir ${surahData.name?.transliteration?.id}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              surahData.tafsir?.id ?? 'missing data',
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        surahData.name?.transliteration?.id?.toUpperCase() ?? 'missing data',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: MyPalettes.appWhite,
                        ),
                      ),
                      Text(
                        "( ${surahData.name?.translation?.id?.toUpperCase() ?? 'missing data'} )",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: MyPalettes.appWhite,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${surahData.numberOfVerses ?? 'missing data'} Ayat | ${surahData.revelation?.id}",
                        style: TextStyle(
                          fontSize: 16,
                          color: MyPalettes.appWhite,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder<detail_surah.DetailSurahModel>(
            future: controller.getDetailSurah(surahData.number.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container();
              }

              if (!snapshot.hasData) {
                return Center(
                  child: Text("Tidak ada data"),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data?.verses?.length ?? 0,
                itemBuilder: (context, index) {
                  // ignore: prefer_is_empty
                  if (snapshot.data?.verses?.length == 0) {
                    return Container();
                  }
                  detail_surah.Verse? ayat = snapshot.data?.verses?[index];

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
                                  child: Text("${index + 1}"),
                                ),
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
                          "${ayat!.text?.arab}",
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
