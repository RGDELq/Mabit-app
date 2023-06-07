import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mabitt/screens/ogin_screen.dart';
import 'package:mabitt/screens/widgets/main_button.dart';
import 'package:mabitt/screens/widgets/text_field_widget.dart';

import '../utils/theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: ColorManager.darkblue, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_sharp),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: 400,
                ),
                const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Hello!  Register to get Started",
                              style: TextStyle(
                                color: Color.fromARGB(255, 17, 77, 95),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: const [],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: const [],
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFieldWidget(
                      label: 'Email Address',
                      controller: emailController,
                      hintText: 'ex: a@example.com',
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please enter your email address";
                        }
                        if (!value.contains('@') || !value.contains('.com')) {
                          return "Enter a Valid Email";
                        }
                        return null;
                      }),
                  TextFieldWidget(
                    label: 'Password',
                    hintText: 'Enter your password',
                    controller: passwordController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  TextFieldWidget(
                    label: 'Confrim  Password',
                    hintText: 'Enter password to confirm',
                    controller: confirmPasswordController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter your password";
                      }
                      if (value != passwordController.text) {
                        return "Thhe password isn't match ";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  MainButton(
                      text: "Sign up ",
                      withBorder: false,
                      isloading: false,
                      onPressed: () {}),
                  MainButton(
                      text: "Have account? Login",
                      withBorder: true,
                      isloading: false,
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: ((context) => const LoginScreenn())));
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
