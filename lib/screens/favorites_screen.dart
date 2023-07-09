import 'package:flutter/material.dart';
import 'package:mabitt/utils/theme.dart';
import 'package:provider/provider.dart';

import '../provider/favorite_provider.dart';
import 'details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favoriteProperties = favoriteProvider.favoriteProperties;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primary,
        title: const Text('Favorites'),
      ),
      body: favoriteProperties.isEmpty
          ? const Center(
              child: Text('You have no favorite properties.'),
            )
          : ListView.builder(
              itemCount: favoriteProperties.length,
              itemBuilder: (context, index) {
                final property = favoriteProperties[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(
                          propertyModel: property,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(property.name),
                    subtitle: Image.asset(
                      property.detail,
                      height: 200,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        favoriteProvider.removeFavoriteProperty(property);
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: error,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
