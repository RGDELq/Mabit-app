import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mabitt/provider/auth_provider.dart';
import 'package:mabitt/provider/dark_mode_provider.dart';
import 'package:mabitt/provider/favorite_provider.dart';
import 'package:mabitt/provider/property_provider.dart';
import 'package:mabitt/screens/splash_screen.dart';
import 'package:mabitt/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
    ChangeNotifierProvider<PropertyProvider>(
        create: (context) => PropertyProvider()),
    ChangeNotifierProvider<FavoriteProvider>(
        create: (context) => FavoriteProvider()),
    ChangeNotifierProvider<DarkModeProvider>(
        create: (context) => DarkModeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    Provider.of<DarkModeProvider>(context, listen: false).initDarkMode();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeProvider>(
        builder: (context, darkModeConsumer, child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor:
                      darkModeConsumer.isDark ? Colors.white : Colors.white),
              iconTheme: IconThemeData(
                  color: darkModeConsumer.isDark ? Colors.white : Colors.black),
              primaryIconTheme: IconThemeData(
                  color: darkModeConsumer.isDark ? Colors.white : Colors.black),
              dividerTheme: DividerThemeData(
                  color:
                      darkModeConsumer.isDark ? Colors.white : Colors.black54),
              listTileTheme: ListTileThemeData(
                  titleTextStyle: TextStyle(
                      color: darkModeConsumer.isDark
                          ? Colors.white
                          : Colors.black)),
              appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                      color: darkModeConsumer.isDark
                          ? Colors.white
                          : Colors.black),
                  color: darkModeConsumer.isDark ? Colors.blue : secprimary),
              primarySwatch: Colors.blue,
              textTheme: GoogleFonts.openSansTextTheme(
                Theme.of(context).textTheme,
              ),
              scaffoldBackgroundColor:
                  darkModeConsumer.isDark ? Colors.black : Colors.white),
          home: const SplashScreen());
    });
  }
}
