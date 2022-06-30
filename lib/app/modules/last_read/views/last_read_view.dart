import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/last_read_controller.dart';

class LastReadView extends GetView<LastReadController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LastReadView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LastReadView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
