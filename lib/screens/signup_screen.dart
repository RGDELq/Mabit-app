import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mabitt/screens/tabs.dart';
import 'package:mabitt/screens/widgets/customized_button.dart';
import 'package:mabitt/screens/widgets/customized_textfield.dart';
import 'package:mabitt/utils/theme.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.darkblue, width: 1),
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
                child: Text("Hello!  Register to get \nStarted",
                    style: TextStyle(
                      color: Color.fromARGB(255, 17, 77, 95),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              CustomizedTextfield(
                myController: _usernameController,
                hintText: "Username",
                isPassword: false,
              ),
              CustomizedTextfield(
                myController: _emailController,
                hintText: "Email",
                isPassword: false,
              ),
              CustomizedTextfield(
                myController: _passwordController,
                hintText: "Password",
                isPassword: true,
              ),
              const SizedBox(
                height: 10,
              ),
              // Center(
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 10, right: 10),
              //     child: Row(
              //       children: [
              //         Expanded(
              //             flex: 1,
              //             child: CountryCodePicker(
              //               onChanged: (country) {},
              //               initialSelection: '+20',
              //               favorite: const ['+39', 'FR', "+966"],
              //               // optional. Shows only country name and flag
              //               showCountryOnly: true,
              //               hideMainText: true,
              //               // optional. Shows only country name and flag when popup is closed.
              //               showOnlyCountryWhenClosed: true,
              //             )),
              //         Expanded(
              //             flex: 4,
              //             child: TextFormField(
              //               keyboardType: TextInputType.phone,
              //               // controller: _mobileNumberEditingController,
              //               decoration: const InputDecoration(
              //                 hintText: ('+218 092 0000000'),
              //                 labelText: 'enter your mobile number',
              //               ),
              //             ))

              //       ],

              //     ),
              //   ),
              // ),

              const SizedBox(
                height: 40,
              ),
              CustomizedButton(
                buttonText: "Register",
                buttonColor: ColorManager.primary,
                textColor: ColorManager.lightPrimary,
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => TabsScreen()));
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.height * 0.15,
                      color: Colors.grey,
                    ),
                    const Text("Or Register with"),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.height * 0.16,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorManager.darkblue, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.facebookF,
                            color: Colors.blueGrey,
                          ),
                          onPressed: () {},
                        )),
                    // Container(
                    //   height: 50,
                    //   width: 100,
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.black, width: 1),
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   child: IconButton(
                    //     icon: const Icon(
                    //       FontAwesomeIcons.google,
                    //       // color: Colors.blue,
                    //     ),
                    //     onPressed: () {},
                    //   ),
                    // ),
                    // Container(
                    //     height: 50,
                    //     width: 100,
                    //     decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.black, width: 1),
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     child: IconButton(
                    //       icon: const Icon(
                    //         FontAwesomeIcons.apple,
                    //         // color: Colors.blue,
                    //       ),
                    //       onPressed: () {},
                    //     ))
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(48, 8, 8, 8.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Already have an account?",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15,
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
                      },
                      child: const Text("  Login Now",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
