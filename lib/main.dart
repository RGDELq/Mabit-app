import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mabitt/provider/auth_provider.dart';
import 'package:mabitt/provider/darkmode_provider.dart';
import 'package:mabitt/provider/favorite_provider.dart';
import 'package:mabitt/provider/property_provider.dart';
import 'package:mabitt/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(
              create: (context) => AuthProvider()),
          ChangeNotifierProvider<PropertyProvider>(
              create: (context) => PropertyProvider()),
          ChangeNotifierProvider<FavoriteProvider>(
              create: (context) => FavoriteProvider()),
          ChangeNotifierProvider<ThemeModeProvider>(
              create: (context) => ThemeModeProvider()),
        ],
        // LocalJsonLocalization.delegate.directories = ['lib/i18n'];

        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'mabit',
          // localizationsDelegates: [
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizationsc.delegate,
          //   AppLocalizations.delegate,
          // ],
          // supportedLocales: [
          //   const Locale('en', ''),
          //   const Locale('ar', ''),
          // ],
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.mulishTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: const SplashScreen(),
        ));
  }
}
