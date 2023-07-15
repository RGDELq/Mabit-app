import 'package:flutter/material.dart';
import 'package:mabitt/screens/widgets/property_widget_onhome.dart';
import 'package:provider/provider.dart';
import '../models/property_model.dart';
import '../provider/dark_mode_provider.dart';
import '../provider/favorite_provider.dart';
import '../utils/theme.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final dakmode = Provider.of<DarkModeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: dakmode.isDark ? primary : secprimary,
        title: const Text('Favorites'),
        centerTitle: true,
      ),
      body: favoritesProvider.favorites.isEmpty
          ? const Center(child: Text('No favorites yet'))
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
