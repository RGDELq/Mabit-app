import 'package:flutter/material.dart';
import 'package:mabitt/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/dark_mode_provider.dart';
import '../provider/property_provider.dart';

class Aboutscreen extends StatelessWidget {
  const Aboutscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dakmode = Provider.of<DarkModeProvider>(context);

    return Consumer<PropertyProvider>(
        builder: (context, propertyConsumer, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("About the application"),
          backgroundColor: primary,
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
              Text(
                'Mabit rental application',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: primary,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Text(
                  ' A rental application that provides you with all places for rent based on their types and from all cities, with quick and easy access to the owner. ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: dakmode.isDark ? white : darkGrey,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                child: IconButton(
                  icon: const Icon(Icons.email),
                  color: primary,
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
                      // ignore: deprecated_member_use
                      await launch(emailUrl);
                    } else {
                      'Could not launch $emailUrl';
                    }
                  },
                ),
              ),
              Text(
                ' Contact with us at gmail: \nraghed44wes@gmail.com ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: dakmode.isDark ? white : darkGrey,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                '  \nAll rights reserved. \n2023 \u00a9 ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: dakmode.isDark ? white : darkGrey,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
