

import 'package:flutter/material.dart';
import 'package:mabitt/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

import '../../models/property_model.dart';
import '../../provider/dark_mode_provider.dart';
import '../../utils/my_string.dart';
import '../../utils/theme.dart';
import '../details_screen.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    Key? key,
    required this.propertyModel,
  }) : super(key: key);

  final PropertyModel propertyModel;

  @override
  Widget build(BuildContext context) {
    final dakmode = Provider.of<DarkModeProvider>(context);
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final isFavorite = favoritesProvider.isFavorite(propertyModel);
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(propertyModel: propertyModel),
        ),
      ),
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                // height: 120,
                width: double.maxFinite,
                // "${baseUrl.replaceAll('/api', '')}/img/" + propertyModel.image,

                "${baseUrl}/img/" + propertyModel.image,
                fit: BoxFit.cover,
              ),
            ),
            //   borderRadius: BorderRadius.circular(12),
            //   child: Image(
            //     height: 120,
            //     width: double.maxFinite,
            //     image: NetworkImage(propertyModel.imageUrl,),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: secprimary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "Check",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),

            Text(
              propertyModel.name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: dakmode.isDark ? darkcolor : darkcolor,
                    fontWeight: FontWeight.bold,
                  ),
            ),

            Text(
              "${propertyModel.rooms} rooms - ${propertyModel.city}  - ${propertyModel.floor} floors",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: dakmode.isDark ? darkcolor : darkcolor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            // ...
            IconButton(
              onPressed: () {
                if (isFavorite) {
                  favoritesProvider.removeFromFavorites(propertyModel);
                } else {
                  favoritesProvider.addToFavorites(propertyModel);
                }
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
