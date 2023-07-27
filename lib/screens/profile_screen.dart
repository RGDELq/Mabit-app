import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mabitt/provider/auth_provider.dart';
import 'package:mabitt/provider/dark_mode_provider.dart';
import 'package:mabitt/screens/about_screen.dart';
import 'package:mabitt/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

import '../utils/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dakmode = Provider.of<DarkModeProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: dakmode.isDark ? primary : secprimary,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     IconButton(
            //       icon: const Icon(
            //         Icons.language,
            //         size: 30,
            //       ),
            //       color: thirdprimary,
            //       onPressed: () {
            //         // Perform language change action
            //       },
            //     ),
            //     const SizedBox(width: 24), // add 24 pixels of horizontal space
            //     Text(
            //       'Language',
            //       style: TextStyle(
            //         fontWeight: FontWeight.w900,
            //         color: dakmode.isDark ? white : primary,
            //       ),
            //     ),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<DarkModeProvider>(
                  builder: (context, dmc, child) {
                    final icon =
                        dmc.isDark ? Icons.light_mode : Icons.dark_mode;
                    return IconButton(
                      icon: Icon(
                        size: 34,
                        icon,
                        color: thirdprimary,
                      ),
                      onPressed: () {
                        Provider.of<DarkModeProvider>(context, listen: false)
                            .switchMode();
                      },
                    );
                  },
                ),
                const SizedBox(width: 24),
                Text(
                  'Theme',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: dakmode.isDark ? white : primary,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.info,
                    size: 30,
                    color: thirdprimary,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: ((context) => const Aboutscreen())));
                  },
                ),
                const SizedBox(width: 24), // add 24 pixels of horizontal space
                Text(
                  'About us',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: dakmode.isDark ? white : primary,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.logout,
                    size: 30,
                  ),
                  color: thirdprimary,
                  onPressed: () async {
                    await authProvider
                        .clearLoginInfo(); // call the clearLoginInfo function that we defined earlier
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: ((context) => const WelcomeScreen())));
                    // Perform logout action
                  },
                ),
                const SizedBox(width: 24), // add 24 pixels of horizontal space
                Text(
                  'Logout',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: dakmode.isDark ? white : primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
