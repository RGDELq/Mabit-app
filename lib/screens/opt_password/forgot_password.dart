import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mabitt/screens/opt_password/send_opt.dart';
import 'package:mabitt/screens/widgets/primary_btn.dart';
import 'package:mabitt/screens/widgets/textfield.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_mode_provider.dart';
import '../../utils/theme.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final dakmode = Provider.of<DarkModeProvider>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.125,
            ),
            const Column(
              children: [
                Text(
                  'Reset your Password',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Text(
                  "Enter your Email To get the code",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            TextFieldWidget(
              filled: true,
              fillColor: dakmode.isDark ? darkcolor : white,
              controller: emailController,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Please enter your email address";
                }

                if (!value.contains('.com') || !value.contains('@')) {
                  return "Enter a Valid Email";
                }

                return null;
              },
              hintText: 'ex: a@example.com',
              label: ' Email address',
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
            Column(
              children: [
                Primarybtn(
                    text: 'contuin',
                    withBorder: false,
                    isloading: false,
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const MyApp()));
                    }),
                Primarybtn(
                    text: 'Back',
                    withBorder: true,
                    isloading: false,
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
