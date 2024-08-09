import 'package:flutter/material.dart';
import 'package:scanme/pages/SplashScreenPage.dart';

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenPage()
    );
  }
}
