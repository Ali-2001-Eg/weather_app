import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'layout/home_screen.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
          // binding: HomeBinding(),
        )
      ],
    );
  }
}
