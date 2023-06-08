import 'package:flutter/material.dart';
import 'package:mabitt/screens/FavoritesScreen.dart';
import 'package:mabitt/screens/home_screen.dart';
import 'package:mabitt/screens/postScreen.dart';
import 'package:mabitt/screens/profile_screen.dart';
import '../helpers/consts.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedSwitcher(
        duration: animationDuration,
        child: currentIndex == 0
            ? const HomePage()
            : currentIndex == 1
                ? const Favuirate()
                : currentIndex == 2
                    ? const PostsScreen()
                    : ProfileScreen(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                'assets/icons/house.png',
                width: size.width / 13,
                height: size.width / 13,
                fit: BoxFit.contain,
                color:
                    currentIndex == 0 ? mainColor : mainColor.withOpacity(0.3),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                'assets/icons/heart.png',
                width: size.width / 13,
                height: size.width / 13,
                fit: BoxFit.contain,
                color:
                    currentIndex == 1 ? mainColor : mainColor.withOpacity(0.3),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                'assets/icons/edit.png',
                width: size.width / 13,
                height: size.width / 13,
                fit: BoxFit.contain,
                color:
                    currentIndex == 2 ? mainColor : mainColor.withOpacity(0.3),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Image.asset(
                'assets/icons/profile.png',
                width: size.width / 13,
                height: size.width / 13,
                color:
                    currentIndex == 3 ? mainColor : mainColor.withOpacity(0.3),
                fit: BoxFit.contain,
              ))
        ],
      ),
    );
  }
}
