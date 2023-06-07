import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mabitt/screens/ogin_screen.dart';
import 'package:mabitt/screens/register_screen.dart';
import 'package:mabitt/screens/widgets/customized_button.dart';
import 'package:mabitt/utils/theme.dart';
import '../routes/routes.dart';

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
              width: 230,
              child: Image(
                  image: AssetImage("assets/logo1.png"), fit: BoxFit.cover),
            ),
            const SizedBox(height: 120),
            CustomizedButton(
              buttonText: "Login",
              buttonColor: ColorManager.primary,
              textColor: ColorManager.lightPrimary,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginScreenn()));

                // Get.offNamed(Routes.loginScreen);
              },
            ),
            CustomizedButton(
              buttonText: "Register",
              buttonColor: ColorManager.white,
              textColor: ColorManager.primary,
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
