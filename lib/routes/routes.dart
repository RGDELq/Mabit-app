import 'package:get/get.dart';
import 'package:mabitt/screens/home_screen.dart';
import '../binding/main_binding.dart';
import '../screens/forgot_passwor.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/welcome_screen.dart';

class AppRoutes {
  //initialRoute

  // static const Getstart = Routes.;
  static const welcome = Routes.welcomeScreen;
  //getPages

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    // GetPage(
    //   name: Routes.getstart,
    //   page: () => const Getstart(),
    // ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      // binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.homepage,
      page: () => HomePage(),
      bindings: [
        MainBininding(),
      ],
      // binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotPassword(),
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const homepage = '/homepage';
  static const getstart = '/getstart';
}
