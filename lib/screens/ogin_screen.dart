import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mabitt/screens/home_screen.dart';
import 'package:mabitt/screens/widgets/main_button.dart';
import 'package:mabitt/screens/widgets/text_field_widget.dart';
import 'package:mabitt/utils/theme.dart';

import 'forgot_passwor.dart';

class LoginScreenn extends StatefulWidget {
  const LoginScreenn({super.key});

  @override
  State<LoginScreenn> createState() => _LoginScreennState();
}

class _LoginScreennState extends State<LoginScreenn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool enableLoginBtn = false;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
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
                          Text("Welcome Back! Glad \nto see you again",
                              style: TextStyle(
                                color: Color.fromARGB(255, 17, 77, 95),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: loginFormKey,
                onChanged: () {
                  setState(() {
                    enableLoginBtn = loginFormKey.currentState!.validate();
                  });
                },
                child: Column(
                  children: [
                    TextFieldWidget(
                      label: 'Email adress',
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
                      },
                    ),
                    TextFieldWidget(
                      label: 'Password',
                      hintText: 'Enter your password',
                      controller: passwordController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please enter your Password";
                        }
                        if (value.length < 8) {
                          return "Password must be at least 8 characters";
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: ((context) =>
                                        const ResetPasswordScreen())));
                          },
                          child: Text(
                            "forgot Password",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.primary,
                            ),
                          ),
                        ),
                        const Text(
                          "?",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    MainButton(
                        text: "Log in",
                        withBorder: false,
                        isloading: false,
                        isActive: enableLoginBtn,
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                  builder: ((context) => HomePage())));
                        }),
                    // MainButton(
                    //     text: "ليس لديك حساب؟ سجل الآن",
                    //     withBorder: true,
                    //     isloading: false,
                    //     onPressed: () {
                    //       // Navigator.push(
                    //       //     context,
                    //       //     CupertinoPageRoute(
                    //       //         builder: ((context) =>
                    //       //             const RegisterScreen())));
                    //     }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
