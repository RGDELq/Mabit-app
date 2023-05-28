import 'package:flutter/material.dart';
import 'package:mabitt/screens/widgets/body.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Color.fromARGB(255, 44, 73, 121),
      ),
      body: Body(),
    );
  }
}