import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mabitt/models/recommended_places_model.dart';
import 'package:mabitt/screens/widgets/body.dart';

import '../models/category_model.dart';
import '../models/property_model.dart';
import 'fav_empty.dart';
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
