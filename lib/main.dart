import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

import 'home.dart';
import 'routes.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Algorítmos',
      theme: ThemeData(primarySwatch: Colors.grey, brightness: Brightness.dark),
      getPages: getAppPages(),
      initialRoute: Home.route,
    );
  }
}
