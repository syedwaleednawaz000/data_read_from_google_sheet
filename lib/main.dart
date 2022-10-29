import 'package:excle_data/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Home/search_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Excel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  SearchView(),
    );
  }
}
