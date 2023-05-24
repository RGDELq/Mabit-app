import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'FavoritesScreen.dart';
import 'home_screen.dart';
import 'postScreen.dart';
import 'profileScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Color.fromARGB(0, 136, 99, 99)));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomTabBar(),
    );
  }
}

class BottomTabBar extends StatefulWidget {
  BottomTabBar({Key? key}) : super(key: key);

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int _index = 0;
  final screens = [
    HomePage(),
    Favuirate(),
    PostsScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_index],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            onTap: (value) {
              setState(() {
                _index = value;
              });
            },
            backgroundColor: Color.fromARGB(255, 227, 227, 227),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Boxicons.bx_home_circle),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Boxicons.bx_search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Boxicons.bxs_user),
                label: 'Profile',
              )
            ]));
  }
}
