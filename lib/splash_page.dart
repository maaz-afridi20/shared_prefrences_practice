import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrences_practice5/home_page.dart';
import 'package:shared_prefrences_practice5/login_page.dart';
import 'package:shared_prefrences_practice5/student_page.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    checkData();
  }

  checkData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool islogin = sp.getBool('islogin') ?? false;
    String usertype = sp.getString('usertype') ?? '';
    if (islogin == true) {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ));
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        image: NetworkImage(
            'https://images.unsplash.com/photo-1664574654589-8f6c9b94c02d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
      ),
    );
  }
}
