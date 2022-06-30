import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/palettes.dart';
import '../../../constants/ratio.dart';
import '../../../data/models/surah_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Al Qur'an Apps"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.SEARCH),
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: EdgeInsets.all(Ratio(context).widthApp * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Assalamu'alaikum",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
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
                    onTap: () {
                      Get.toNamed(Routes.LAST_READ);
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: -50,
                            right: 0,
                            child: Opacity(
                              opacity: 0.7,
                              child: Container(
                                width: 200,
                                height: 200,
                                child: Image.asset("assets/logo/alquran.png"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.menu_book_rounded,
                                      color: MyPalettes.appWhite,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Terakhir dibaca",
                                      style: TextStyle(
                                        color: MyPalettes.appWhite,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Al Fatihah",
                                  style: TextStyle(
                                    color: MyPalettes.appWhite,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "Just 1 | Ayat 5",
                                  style: TextStyle(
                                    color: MyPalettes.appWhite,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              TabBar(
                labelColor: MyPalettes.appPurpleDark,
                unselectedLabelColor: Colors.grey,
                indicatorColor: MyPalettes.appPurpleDark,
                tabs: [
                  Tab(
                    text: "Surah",
                  ),
                  Tab(
                    text: "Jus",
                  ),
                  Tab(
                    text: "Bookmark",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    FutureBuilder<List<SurahModel>>(
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
                                backgroundColor: MyPalettes.appPurple,
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
                    Center(
                      child: Text(
                        "Page 1",
                      ),
                    ),
                    Center(
                      child: Text(
                        "Page 1",
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
