import 'package:get/get.dart';
import 'package:mabitt/screens/FavoritesScreen.dart';
import 'package:mabitt/screens/postScreen.dart';
import 'package:mabitt/screens/profile_screen.dart';

import '../screens/home_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  var tabs = [
    HomePage(),
    Favuirate(),
    PostsScreen(),
    ProfileScreen(),
  ].obs;

  var title = [
    "Asroo Shop",
    "Categories",
    'Favourites',
    "Settings",
  ].obs;
}
