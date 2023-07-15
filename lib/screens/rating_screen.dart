import 'package:flutter/material.dart';
import 'package:mabitt/provider/rating_provider.dart';
import 'package:mabitt/screens/widgets/primary_btn.dart';
import 'package:mabitt/screens/widgets/rating_card.dart';
import 'package:mabitt/screens/widgets/textfield.dart';
import 'package:mabitt/utils/theme.dart';
import 'package:provider/provider.dart';

import '../provider/dark_mode_provider.dart';

class Reviews extends StatefulWidget {
  final int propertyId;

  const Reviews({required this.propertyId, required Key key}) : super(key: key);

  @override
  ReviewsState createState() => ReviewsState();
}

class ReviewsState extends State<Reviews> {
  bool isMore = false;

  @override
  void initState() {
    Provider.of<RatingProvider>(context, listen: false).getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dakmode = Provider.of<DarkModeProvider>(context);

    return Consumer<RatingProvider>(builder: (context, ratingConsumer, child) {
      // Filter comments by property id
      final comments = ratingConsumer.comments
          .where((c) => c.propertyId == widget.propertyId)
          .toList();

      return Scaffold(
        backgroundColor: dakmode.isDark ? white : secprimary,
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
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final rating = comments[index];
                return ReviewUI(
                  name: rating.name,
                  createdAt: rating.createdAt
                      .toString()
                      .substring(0, 10)
                      .replaceAll('-', '/'),
                  updateded_at: rating.updatedAt
                      .toString()
                      .substring(0, 10)
                      .replaceAll('-', '/'),
                  ptoperty_id: rating.propertyId,
                  key: ValueKey(index),
                );
              },
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
                      return const MyDialog();
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

class MyDialog extends StatefulWidget {
  const MyDialog({super.key});

  @override
  MyDialogState createState() => MyDialogState();
}

class MyDialogState extends State<MyDialog> {
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dakmode = Provider.of<DarkModeProvider>(context);
    final ratingProvider = Provider.of<RatingProvider>(context, listen: false);

    return Consumer<RatingProvider>(builder: (context, ratingconsumer, child) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 10), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Enter comment',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
              TextFieldWidget(
                filled: true,
                fillColor: dakmode.isDark ? darkcolor : white,
                label: 'comment ',
                hintText: 'Enter ccomment ',
                controller: commentController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter the name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Primarybtn(
                text: 'save',
                withBorder: false,
                isloading: false,
                onPressed: () {
                  ratingProvider.addcomment({
                    "name": commentController.text.toString(),
                    // "property_id": '19'
                  });
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
