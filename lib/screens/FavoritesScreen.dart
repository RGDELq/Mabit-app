import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Favuirate extends StatefulWidget {
  const Favuirate({super.key});

  @override
  State<Favuirate> createState() => _FavuirateState();
}

class _FavuirateState extends State<Favuirate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 8.0,
          ),
        ),
        child: const Text("page"),
      ),

    );
    
  }
}
