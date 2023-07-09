import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mabitt/screens/welcome_screen.dart';

import '../utils/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (_) => const WelcomeScreen()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: Column(children: [
              const Spacer(),
              Image.asset(
                height: 500,
                fit: BoxFit.contain,
                'assets/splashscreen.gif',
              ),
              const SizedBox(height: 20),
              const Text(
                "Explore all the places  \nonly with us",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                " Find your new home to rent on Mabit  ,\nfrom all destinations",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: darkcolor,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
            ]),
          ),
        ),
      ),
    );
  }
}
