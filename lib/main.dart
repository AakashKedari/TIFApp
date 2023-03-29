import 'package:flutter/material.dart';
import 'package:saas/views/Splash.dart';
import 'package:saas/views/events.dart';
import 'package:saas/views/searchPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialRoute: "/",
    );
  }
}
