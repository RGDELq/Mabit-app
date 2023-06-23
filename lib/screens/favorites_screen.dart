import 'package:flutter/material.dart';

class Favuirate extends StatefulWidget {
  const Favuirate({super.key});

  @override
  State<Favuirate> createState() => _FavuirateState();
}

class _FavuirateState extends State<Favuirate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("favourite properties"),
        backgroundColor: const Color.fromARGB(255, 44, 73, 121),
        centerTitle: true,
      ),
      body: const SizedBox(
        height: 670,
        width: 400,
      ),
    );
  }
}
