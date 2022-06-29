import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_quran/app/constants/ratio.dart';
import 'package:my_quran/app/data/models/surah.dart';

import '../../../data/models/detail_surah.dart' as detail_surah;
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
          Card(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    surahData.name?.transliteration?.id?.toUpperCase() ?? 'missing data',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "( ${surahData.name?.translation?.id?.toUpperCase() ?? 'missing data'} )",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${surahData.numberOfVerses ?? 'missing data'} Ayat | ${surahData.revelation?.id}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
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
              return Expanded(
                child: ListView.builder(
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
                        Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  child: Text("${index + 1}"),
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
                        Text(
                          "${ayat.translation!.id}",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
