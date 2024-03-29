import 'package:flutter/material.dart';
import 'package:mabitt/screens/favorites_screen.dart';
import 'package:mabitt/screens/home_screen.dart';
import 'package:mabitt/screens/post_screen.dart';
import 'package:mabitt/screens/profile_screen.dart';
import 'package:provider/provider.dart';

import '../provider/dark_mode_provider.dart';
import '../utils/theme.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final dakmode = Provider.of<DarkModeProvider>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: dakmode.isDark ? darkcolor : secprimary,
      body: AnimatedSwitcher(
        duration: animationDuration,
        child: currentIndex == 0
            ? const HomePage()
            : currentIndex == 1
                ? const FavoritesScreen()
                : currentIndex == 2
                    ? const PostsScreen()
                    : const ProfileScreen(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: dakmode.isDark ? white : primary,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(
          color: dakmode.isDark ? white : primary,
        ),
        backgroundColor: dakmode.isDark ? darkcolor : secprimary,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              backgroundColor: dakmode.isDark ? darkcolor : secprimary,
              label: 'Home',
              icon: Image.asset(
                'assets/icons/house.png',
                width: size.width / 13,
                height: size.width / 13,
                fit: BoxFit.contain,
                color: currentIndex == 0 ? pcolor : pcolor.withOpacity(0.3),
              )),
          BottomNavigationBarItem(
              backgroundColor: dakmode.isDark ? darkcolor : secprimary,
              label: 'Fav',
              icon: Image.asset(
                'assets/icons/wishlist.png',
                width: size.width / 13,
                height: size.width / 13,
                fit: BoxFit.contain,
                color: currentIndex == 1 ? pcolor : pcolor.withOpacity(0.3),
              )),
          BottomNavigationBarItem(
              backgroundColor: dakmode.isDark ? darkcolor : secprimary,
              label: 'post',
              icon: Image.asset(
                'assets/icons/post.png',
                width: size.width / 13,
                height: size.width / 13,
                fit: BoxFit.contain,
                color: currentIndex == 2 ? pcolor : pcolor.withOpacity(0.3),
              )),
          BottomNavigationBarItem(
              label: 'profile',
              backgroundColor: dakmode.isDark ? darkcolor : secprimary,
              icon: Image.asset(
                'assets/icons/profile.png',
                width: size.width / 13,
                height: size.width / 13,
                color: currentIndex == 3 ? pcolor : pcolor.withOpacity(0.3),
                fit: BoxFit.contain,
              ))
        ],
      ),
    );
  }
}
