import 'package:flutter/material.dart';
import 'package:shared_prefrences_practice5/home_page.dart';
import 'package:shared_prefrences_practice5/login_page.dart';
import 'package:shared_prefrences_practice5/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
