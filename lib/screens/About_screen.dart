import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Aboutscreen extends StatefulWidget {
  const Aboutscreen({super.key});

  @override
  State<Aboutscreen> createState() => _AboutscreenState();
}

class _AboutscreenState extends State<Aboutscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About the application"),
        backgroundColor: const Color.fromARGB(255, 44, 73, 121),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo1.png',
              height: 200,
            ),
            const SizedBox(height: 50),
            const Text(
              'Mabit rental application',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 44, 73, 121),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(40.0),
              child: Text(
                ' A rental application that provides you with all places for rent based on their types and from all cities, with quick and easy access to the owner. ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              child: IconButton(
                icon: const Icon(Icons.email),
                color: const Color.fromARGB(255, 44, 73, 121),
                onPressed: () async {
                  // Construct the email URL
                  String emailAddress = 'raghed44wes@gmail.com';
                  String subject = 'Hello';
                  String body = 'i am mabit user..?';
                  String emailUrl =
                      'mailto:$emailAddress?subject=$subject&body=$body';

                  // Launch the URL
                  // ignore: deprecated_member_use
                  if (await canLaunch(emailUrl)) {
                    await launch(emailUrl);
                  } else {
                    throw 'Could not launch $emailUrl';
                  }
                },
              ),
            ),
            const Text(
              ' Contact with us at gmail: raghed44wes@gmail.com ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              '  \nAll rights reserved. \n2023 \u00a9 ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
