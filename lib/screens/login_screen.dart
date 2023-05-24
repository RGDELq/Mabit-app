import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mabitt/screens/signup_screen.dart';
import 'package:mabitt/screens/tabs.dart';
import 'package:mabitt/screens/widgets/customized_button.dart';
import 'package:mabitt/screens/widgets/customized_textfield.dart';

import '../routes/routes.dart';
import '../utils/theme.dart';
import 'forgot_passwor.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorManager.darkblue, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                                icon: const Icon(Icons.arrow_back_ios_sharp),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Welcome Back! Glad \nto see you again",
                              style: TextStyle(
                                color: Color.fromARGB(255, 17, 77, 95),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        CustomizedTextfield(
                          myController: _emailController,
                          hintText: "Enter your Email",
                          isPassword: false,
                        ),
                        CustomizedTextfield(
                          myController: _passwordController,
                          hintText: "Enter your Password",
                          isPassword: true,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPassword()));
                              },
                              child: const Text("Forgot Password?",
                                  style: TextStyle(
                                    color: Color(0xff6A707C),
                                    fontSize: 15,
                                  )),
                            ),
                          ),
                        ),
                        CustomizedButton(
                            buttonText: "Login",
                            buttonColor: const Color.fromARGB(255, 17, 77, 95),
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => TabsScreen()));
                              // Get.offNamed(Routes.homepage);
                            }),
                      ]),
                ))));
  }
}
