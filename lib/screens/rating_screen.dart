import 'package:flutter/material.dart';
import 'package:mabitt/screens/widgets/rating_card.dart';
import 'package:mabitt/utils/theme.dart';
import 'package:provider/provider.dart';

import '../models/rating_model.dart';
import '../provider/property_provider.dart';

class Reviews extends StatefulWidget {
  const Reviews({required Key key}) : super(key: key);

  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  bool isMore = false;

  @override
  void initState() {
    Provider.of<PropertyProvider>(context, listen: false).getComments();

    super.initState();
  }

  Widget build(BuildContext context) {
    return Consumer<PropertyProvider>(
        builder: (context, propertyConsumer, child) {
      return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: const Text("Reviews"),
          // child: DefaultBackButton(),
        ),
        body: Stack(
          children: [
            ListView.builder(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
              itemCount: propertyConsumer.comments.length,

              itemBuilder: (context, index) {
                final rating = propertyConsumer.comments[index];
                return ReviewUI(
                  name: rating.name,
                  updateded_at: rating.updatedAt,
                  ptoperty_id: rating.propertyId,
                  createdAt: rating.createdAt,
                  key: ValueKey(index),
                );
              },
              // separatorBuilder: (context, index) {
              //   return Divider(
              //     thickness: 1.0,
              //     color: primary,
              //   );
              // },
            ),
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: FloatingActionButton(
                onPressed: () {
                  // Handle floating action button press
                },
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      );
    });
  }
}
