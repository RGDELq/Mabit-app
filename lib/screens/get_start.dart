import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mabitt/screens/welcome_screen.dart';

class Getstart extends StatelessWidget {
  const Getstart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: Column(
              children: [
                const Spacer(),
                Image.asset(
                  'assets/rentl.png',
                ),
                const SizedBox(height: 20),
                const Text(
                  "Explore all the places  \nonly with us",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // const SizedBox(height: 20),
                const Text(
                  " Find your new home to rent on Mabit  ,\nfrom all destinations",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => WelcomeScreen()));

                        // Get.offNamed(Routes.welcomeScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 8.0,
                        ),
                      ),
                      child: const Text("Get Started"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
