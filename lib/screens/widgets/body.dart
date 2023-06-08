import 'package:flutter/material.dart';
import 'package:mabitt/screens/get_start.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/",
            press: () => {
              //  Navigator.push(
              //     context, MaterialPageRoute(builder: (_) => FilterButton())),
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/exit.png",
            press: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SplashScreen()));
            },
          ),
        ],
      ),
    );
  }
}
