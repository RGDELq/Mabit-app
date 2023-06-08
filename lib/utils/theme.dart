import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = Color.fromARGB(255, 44, 73, 121);
  static Color darkblue = const Color(0xff114E60);
  static Color darkGrey = const Color(0xff737477);
  static Color lightGrey = const Color(0xff9E9E9E);
  static Color TColor = const Color(0xff000000);
  static Color pistacho = const Color(0xffF5cef9);

  // new colors
  static Color thirdPrimary = const Color(0xffF5CEBE);
  static Color lightPrimary = const Color(0xffF9EEc8); // color with 80% opacity
  static Color grey1 = const Color(0xff707070);
  static Color grey2 = const Color(0xff797979);
  static Color white = const Color(0xffFFFFFF);
  static Color error = const Color(0xffe61f34); // red color
}

class TColor {
  static Color get primary => const Color(0xff20D994);
  static Color get primaryText => const Color(0xffffffff);

  static Color get secondary => const Color(0xff173143);
  static Color get text => secondary;

  static Color get rating => const Color(0xffCDD614);

  static Color get color1 => const Color(0xffE8334A);
  static Color get color2 => const Color(0xff60B8F6);

  static Color get gray => const Color(0xff9D9D9D);
  static Color get bg => const Color(0xffF2F2F3);

  static List<Color> get list => [
        const Color(0xffE8334A),
        const Color(0xffF5821F),
        const Color(0xff63BF67)
      ];
  static List<Color> get favList => [
        const Color(0xff4F2E19),
        const Color(0xff794C2F),
        const Color(0xff933017),
        const Color(0xff435124),
        const Color(0xff523B13),
        const Color(0xff322216)
      ];
}
