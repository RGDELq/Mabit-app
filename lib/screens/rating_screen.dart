import 'package:flutter/material.dart';
import 'package:mabitt/screens/widgets/dialog.dart';
import 'package:mabitt/screens/widgets/rating_card.dart';
import 'package:mabitt/utils/theme.dart';
import 'package:provider/provider.dart';

import '../provider/property_provider.dart';

class Reviews extends StatefulWidget {
  const Reviews({required Key key}) : super(key: key);

  @override
  ReviewsState createState() => ReviewsState();
}

class ReviewsState extends State<Reviews> {
  bool isMore = false;

  @override
  void initState() {
    Provider.of<PropertyProvider>(context, listen: false).getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PropertyProvider>(
        builder: (context, propertyConsumer, child) {
      return Scaffold(
        backgroundColor: secprimary,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: primary,
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
                  createdAt: rating.createdAt
                      .toString()
                      .substring(0, 10)
                      .replaceAll('-', '/'),
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
                backgroundColor: primary,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return MyDialog();
                    },
                  );
                },
                tooltip: 'Add Review',
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      );
    });
  }
}
