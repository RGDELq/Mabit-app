import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mabitt/screens/navigator.dart';
import 'package:mabitt/screens/widgets/primary_btn.dart';
import 'package:mabitt/screens/widgets/phone_textfiled.dart';
import 'package:mabitt/screens/widgets/textfield.dart';

import '../utils/theme.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

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
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: darkblue, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_sharp),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ),
                const SizedBox(
                  height: 200,
                  width: 400,
                ),
                const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 40,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
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
                                padding: EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [],
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
                    label: 'username',
                    hintText: 'Enter username ',
                    controller: usernameController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter the name';
                      }
                      return null;
                    },
                  ),
                  TextFieldWidget(
                      label: 'Email Address',
                      controller: emailController,
                      hintText: 'Ex: a@example.com',
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
                  PhoneTextFieldWidget(
                    keyboardType: TextInputType.phone,
                    label: 'Phone number',
                    hintText: 'Ex: 09X0000000',
                    controller: phoneController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter your Phone number";
                      }
                      if (value.length != 10) {
                        return "please enter a valid phone number";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Primarybtn(
                      text: "Sign up ",
                      withBorder: false,
                      isloading: false,
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: ((context) => const TabsScreen())));
                      }),
                  Primarybtn(
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
