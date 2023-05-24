
import 'package:expence_tracker/screen/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (p0) => Transaction_Screen(),
      },
    ),
  );
}