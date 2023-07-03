import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mabitt/screens/About_screen.dart';
import 'package:mabitt/screens/welcome_screen.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: const Color.fromARGB(255, 44, 73, 121),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.language),
                  color: const Color.fromARGB(255, 181, 220, 172),
                  onPressed: () {
                    // Perform language change action
                  },
                ),
                const SizedBox(width: 8),
                const Text(
                  'Language',
                  style: TextStyle(
                    color: Color.fromARGB(255, 44, 73, 121),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.color_lens),
                  color: const Color.fromARGB(255, 181, 220, 172),
                  onPressed: () {
                    // Perform theme change action
                  },
                ),
                const SizedBox(width: 8),
                const Text(
                  'Theme',
                  style: TextStyle(
                    color: Color.fromARGB(255, 44, 73, 121),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.info,
                    color: Color.fromARGB(255, 181, 220, 172),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: ((context) => const Aboutscreen())));
                  },
                ),
                const SizedBox(width: 8),
                const Text(
                  'About us',
                  style: TextStyle(
                    color: Color.fromARGB(255, 44, 73, 121),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.logout),
                  color: const Color.fromARGB(255, 181, 220, 172),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: ((context) => const WelcomeScreen())));
                    // Perform logout action
                  },
                ),
                const SizedBox(width: 8),
                const Text(
                  'Logout',
                  style: TextStyle(
                    color: Color.fromARGB(255, 44, 73, 121),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
