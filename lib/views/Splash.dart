import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saas/views/events.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    setState(() {});
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push((context),
          MaterialPageRoute(builder: (context) => const EventPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
              child: const Image(
            image: AssetImage('assets/images/download.png'),
            fit: BoxFit.cover,
          )),
        ),
      ),
    );
  }
}
