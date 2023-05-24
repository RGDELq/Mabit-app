import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mabitt/screens/signup_screen.dart';
import 'package:mabitt/screens/widgets/customized_button.dart';
import 'package:mabitt/utils/theme.dart';
import '../routes/routes.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 260,
              width: 220,
              child: Image(
                  image: AssetImage("assets/logo1.png"), fit: BoxFit.cover),
            ),
            const SizedBox(height: 40),
            CustomizedButton(
              buttonText: "Login",
              buttonColor: ColorManager.primary,
              textColor: ColorManager.lightPrimary,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));

                // Get.offNamed(Routes.loginScreen);
              },
            ),
            CustomizedButton(
              buttonText: "Register",
              buttonColor: ColorManager.lightPrimary,
              textColor: ColorManager.primary,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SignUpScreen()));

                Get.offNamed(Routes.signUpScreen);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
