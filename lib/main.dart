import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mabitt/provider/auth_provider.dart';
import 'package:mabitt/provider/dark_mode_provider.dart';
import 'package:mabitt/provider/favorite_provider.dart';
import 'package:mabitt/provider/property_provider.dart';
import 'package:mabitt/provider/rating_provider.dart';
import 'package:mabitt/screens/splash_screen.dart';
import 'package:mabitt/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
    ChangeNotifierProvider<PropertyProvider>(
        create: (context) => PropertyProvider()),
    ChangeNotifierProvider<FavoritesProvider>(
        create: (context) => FavoritesProvider()),
    ChangeNotifierProvider<DarkModeProvider>(
        create: (context) => DarkModeProvider()),
    ChangeNotifierProvider<RatingProvider>(
        create: (context) => RatingProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.system);
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
                  color: darkModeConsumer.isDark ? Colors.white : darkcolor),
              primaryIconTheme: IconThemeData(
                  color: darkModeConsumer.isDark ? Colors.white : darkcolor),
              dividerTheme: DividerThemeData(
                  color: darkModeConsumer.isDark ? Colors.white : darkcolor),
              listTileTheme: ListTileThemeData(
                  titleTextStyle: TextStyle(
                      color:
                          darkModeConsumer.isDark ? Colors.white : darkcolor)),
              appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                      color:
                          darkModeConsumer.isDark ? Colors.white : darkcolor),
                  color: darkModeConsumer.isDark ? Colors.blue : secprimary),
              primarySwatch: Colors.blue,
              textTheme: GoogleFonts.openSansTextTheme(
                Theme.of(context).textTheme,
              ),
              scaffoldBackgroundColor:
                  darkModeConsumer.isDark ? darkcolor : Colors.white),
          home: const SplashScreen());
    });
  }
}
