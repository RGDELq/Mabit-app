import 'package:flutter/material.dart';
import 'package:mabitt/screens/widgets/primary_btn.dart';

class MyDialog extends StatefulWidget {
  const MyDialog({super.key});

  @override
  MyDialogState createState() => MyDialogState();
}

class MyDialogState extends State<MyDialog> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Type your text here',
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Primarybtn(
                  withBorder: false,
                  isloading: false,
                  onPressed: () {
                    // Handle form submission
                    Navigator.of(context).pop();
                  },
                  text: 'save'),
            ],
          ),
        ));
  }
}
