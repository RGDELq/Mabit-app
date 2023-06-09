import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/property_model.dart';

import 'home_screen.dart';

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
      body: SizedBox(
        height: 670,
        width: 400,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: properties.length,
          itemBuilder: (BuildContext context, int index) {
            final PropertyModel propertyModel = properties[index];
            return RecommendationCard(propertyModel: propertyModel);
          },
        ),
      ),

    );

  }
}
