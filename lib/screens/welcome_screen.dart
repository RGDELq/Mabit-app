import 'package:flutter/material.dart';
import 'package:mabitt/screens/login_screen.dart';
import 'package:mabitt/screens/navigator.dart';
import 'package:mabitt/screens/register_screen.dart';
import 'package:mabitt/screens/widgets/customized_btn.dart';
import 'package:mabitt/utils/theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 260,
              width: 230,
              child: Image(
                  image: AssetImage("assets/logo1.png"), fit: BoxFit.cover),
            ),
            const SizedBox(height: 120),
            CustomizedButton(
              buttonText: "Login",
              buttonColor: primary,
              textColor: white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const TabsScreen()));

                // Get.offNamed(Routes.loginScreen);
              },
            ),
            CustomizedButton(
              buttonText: "Register",
              buttonColor: white,
              textColor: primary,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const RegisterScreen()));
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
