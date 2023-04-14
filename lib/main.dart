import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_data/GetX/Controller/controller.dart';
import 'GetX/data_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final DataController c = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DataScreen(),
    );
  }
}
