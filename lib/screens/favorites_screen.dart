import 'package:flutter/material.dart';
import 'package:mabitt/screens/widgets/property_widget_onhome.dart';
import 'package:provider/provider.dart';
import '../models/property_model.dart';
import '../provider/dark_mode_provider.dart';
import '../provider/favorite_provider.dart';
import '../utils/theme.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final darkMode = Provider.of<DarkModeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkMode.isDark ? primary : secprimary,
        title: const Text('Favorites'),
        centerTitle: true,
      ),
      body: favoritesProvider.favorites.isEmpty
          ? Center(
              child: Image.asset(
                'images/fav.png',
                height: 600,
              ),
            )
          : ListView.builder(
              itemCount: favoritesProvider.favorites.length,
              itemBuilder: (BuildContext context, int index) {
                final PropertyModel propertyModel =
                    favoritesProvider.favorites[index];

                return RecommendationCard(
                  propertyModel: propertyModel,
                );
              },
            ),
    );
  }
}
