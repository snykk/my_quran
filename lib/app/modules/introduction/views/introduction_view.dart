import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/ratio.dart';
import '../../../routes/app_pages.dart';
import '../../../constants/palettes.dart';
import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Al-Qur'an Apps",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Ratio(context).widthApp * 0.0025,
              ),
              child: Text(
                "Baca aku, insya'allah aku akan menjadi syafaatmu di akhirat kelak",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: Ratio(context).widthApp * 0.7,
                width: Ratio(context).widthApp * 0.7,
                child: Lottie.asset("assets/lotties/animation-intro.json"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(Routes.HOME);
              },
              child: Text(
                "GET STARTED",
                style: TextStyle(
                  color: Get.isDarkMode ? MyPalettes.appPurpleDark : MyPalettes.appWhite,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Get.isDarkMode ? MyPalettes.appWhite : MyPalettes.appPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
