import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

Color primary = const Color.fromARGB(255, 44, 73, 121);
Color darkblue = const Color(0xff114E60);
Color darkGrey = const Color(0xff737477);
Color lightGrey = const Color(0xff9E9E9E);
Color tColor = const Color(0xff000000);
Color pistacho = const Color(0xffF5cef9);

// new colors
Color thirdPrimary = const Color(0xffF5CEBE);
Color lightPrimary = const Color(0xffF9EEc8); // color with 80% opacity
Color grey1 = const Color(0xff707070);
Color grey2 = const Color(0xff797979);
Color white = const Color(0xffFFFFFF);
Color error = const Color(0xffe61f34); // red color

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

// pickImage(ImageSource source) async {
//   final ImagePicker imagePicker = ImagePicker();
//   XFile? file = await imagePicker.pickImage(source: source);
//   if (file != null) {
//     return await file.readAsBytes();
//   }
//   // print('No Images Selected');
// }

Color pcolor = const Color.fromARGB(255, 44, 73, 121);

Duration animationDuration = const Duration(milliseconds: 200);
