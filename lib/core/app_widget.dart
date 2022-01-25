
import 'package:flutter/material.dart';
import 'package:organics/challenge/challenge_page.dart';
import 'package:organics/home/home_page.dart';
import 'package:organics/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      home: SplashPage(),
      );
  }
}
