import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mabitt/screens/get_start.dart';
import 'package:get/get.dart';
import 'package:mabitt/screens/ogin_screen.dart';
import 'package:mabitt/screens/register_screen.dart';
import 'package:mabitt/screens/welcome_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'mabit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.mulishTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Getstart(),
    );
  }
}
