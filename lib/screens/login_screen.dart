import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mabitt/provider/auth_provider.dart';
import 'package:mabitt/screens/navigator.dart';
import 'package:mabitt/screens/widgets/primary_btn.dart';
import 'package:mabitt/screens/widgets/textfield.dart';
import 'package:mabitt/utils/theme.dart';
import 'package:provider/provider.dart';
import '../provider/dark_mode_provider.dart';
import 'opt_password/send_opt.dart';

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
    final dakmode = Provider.of<DarkModeProvider>(context);

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
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
                Positioned(
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
                                color:primary,
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
                      filled: true,
                      fillColor: dakmode.isDark ? darkcolor : Colors.white,
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
                      filled: true,
                      fillColor: dakmode.isDark ? darkcolor : Colors.white,
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
                            Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                    builder: ((context) => const MyApp())));
                          },
                          child: Text(
                            "forgot Password",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Primarybtn(
                        text: "Log in",
                        withBorder: false,
                        isloading: false,
                        isActive: enableLoginBtn,
                        onPressed: () {
                          authProvider.login({
                            "email": emailController.text,
                            "password": passwordController.text
                          });
                          Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                  builder: ((context) => const TabsScreen())));
                          Center(
                              child: authProvider.loading
                                  ? const CircularProgressIndicator()
                                  : const Text('login'));
                        }),
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
