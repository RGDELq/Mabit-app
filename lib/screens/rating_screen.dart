import 'package:flutter/material.dart';
import 'package:mabitt/provider/rating_provider.dart';
import 'package:mabitt/screens/widgets/primary_btn.dart';
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
    final darkMode = Provider.of<DarkModeProvider>(context);
    print('MyDialogState build: propertyId=${widget.propertyId}');

    return Consumer<RatingProvider>(builder: (context, ratingConsumer, child) {
      // Filter comments by property id
      final comments = ratingConsumer.comments
          .where((c) => c.propertyId == widget.propertyId)
          .toList();

      return Scaffold(
        backgroundColor: darkMode.isDark ? darkcolor : secprimary,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: primary,
          title: const Text("Reviews"),
          // child: DefaultBackButton(),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final rating = comments[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: darkMode.isDark ? primary : white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              rating.username,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              rating.createdAt
                                  .toString()
                                  .substring(0, 10)
                                  .replaceAll('-', '/'),
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        const SizedBox(height: 8.0),
                        Text(
                          rating.name,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  );
                },
              ),
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
                      return MyDialog(propertyId: widget.propertyId);
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
  final int propertyId;

  const MyDialog({required this.propertyId});

  @override
  MyDialogState createState() => MyDialogState();
}

class MyDialogState extends State<MyDialog> {
  final TextEditingController commentController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  bool enablerateBtn = false;
  GlobalKey<FormState> rateFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkModeProvider>(context);
    final ratingProvider = Provider.of<RatingProvider>(context, listen: false);

    return Consumer<RatingProvider>(builder: (context, ratingConsumer, child) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                darkMode.isDark ? Colors.grey[800]! : secprimary,
                darkMode.isDark ? Colors.grey[900]! : secprimary,
              ],
            ),
          ),
          child: Form(
            key: rateFormKey,
            onChanged: () {
              setState(() {
                enablerateBtn = rateFormKey.currentState!.validate();
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Add comment',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                TextFieldWidget(
                  filled: true,
                  fillColor: darkMode.isDark ? Colors.grey[800]! : Colors.white,
                  label: 'your name ',
                  hintText: 'Enter name ',
                  controller: usernameController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter the name';
                    }
                    return null;
                  },
                ),
                TextFieldWidget(
                  filled: true,
                  fillColor: darkMode.isDark ? Colors.grey[800]! : Colors.white,
                  label: 'comment ',
                  hintText: 'Enter comment ',
                  controller: commentController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter the comment';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                Primarybtn(
                  text: 'save',
                  withBorder: false,
                  isActive: enablerateBtn,
                  isloading: false,
                  onPressed: () {
                    ratingProvider.addcomment({
                      "name": commentController.text.toString(),
                      "username": usernameController.text.toString(),
                      "status": '0',
                      "property_id": widget.propertyId
                    }).then((response) {
                      Navigator.of(context).pop();

                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('success'),
                              content: const Text(
                                  'your information have been submitted successfully.'),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                      // print(
                      //     response.statusCode.toString() + " " + response.body);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
