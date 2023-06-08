import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mabitt/screens/Send_opt.dart';
import 'package:mabitt/screens/widgets/main_button.dart';
import 'package:mabitt/screens/widgets/text_field_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.125,
            ),
            Column(
              children: const [
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
            SizedBox(
              height: 40,
            ),
            TextFieldWidget(
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
                MainButton(
                    text: 'contuin',
                    withBorder: false,
                    isloading: false,
                    onPressed: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) => MyApp()));
                    }),
                MainButton(
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
