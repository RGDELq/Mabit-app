import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mabitt/screens/FavoritesScreen.dart';
import 'package:mabitt/screens/widgets/custom_icon_button.dart';
import 'package:mabitt/screens/widgets/location_card.dart';
import 'package:mabitt/screens/widgets/nearby_places.dart';
import 'package:mabitt/screens/widgets/recommended_places.dart';
import 'package:mabitt/screens/widgets/tourist_places.dart';
import '../controllers/main_controller.dart';
import '../utils/theme.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: ColorManager.darkblue,
              foregroundColor: Colors.white,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Good Morning"),
                  Text(
                    "user...",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              actions: const [
                CustomIconButton(
                  icon: Icon(Ionicons.search_outline),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 12),
                  child: CustomIconButton(
                    icon: Icon(Ionicons.notifications_outline),
                  ),
                ),
              ],
            ),
            // ListView(
            //   physics: const BouncingScrollPhysics(),
            //   padding: const EdgeInsets.all(14),
            //   children: [
            //     // LOCATION CARD
            //     const LocationCard(),
            //     const SizedBox(
            //       height: 15,
            //     ),
            //     const TouristPlaces(),
            //     // CATEGORIES
            //     const SizedBox(height: 10),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(
            //           "Recommendation",
            //           style: Theme.of(context).textTheme.titleLarge,
            //         ),
            //         TextButton(onPressed: () {}, child: const Text("View All"))
            //       ],
            //     ),
            //     const SizedBox(height: 10),
            //     const RecommendedPlaces(),
            //     const SizedBox(height: 10),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(
            //           "Others",
            //           style: Theme.of(context).textTheme.titleLarge,
            //         ),
            //         TextButton(onPressed: () {}, child: const Text("View All"))
            //       ],
            //     ),
            //     const SizedBox(height: 10),
            //     const NearbyPlaces(),
            //   ],
            // ),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Ionicons.home_outline),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Ionicons.heart),
                    label: "favouirt",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Ionicons.book_outline),
                    label: "post",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Ionicons.person_outline),
                    label: "Profile",
                  )
                ],
                onTap: (index) {
                  controller.currentIndex.value = index;
                }),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs,
            ));
      }),
    );
  }
}
