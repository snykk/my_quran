import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_juz_controller.dart';

class DetailJuzView extends GetView<DetailJuzController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailJuzView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailJuzView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
