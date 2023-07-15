import 'package:flutter/material.dart';
import 'package:mabitt/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

import '../../models/property_model.dart';
import '../../provider/dark_mode_provider.dart';
import '../../utils/my_string.dart';
import '../../utils/theme.dart';
import '../details_screen.dart';

class PropertyCard2 extends StatelessWidget {
  const PropertyCard2({
    Key? key,
    required this.propertyModel,
  }) : super(key: key);

  final PropertyModel propertyModel;

  @override
  Widget build(BuildContext context) {
    final dakmode = Provider.of<DarkModeProvider>(context);
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
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                width: double.maxFinite,
                "${baseUrl}/img/" + propertyModel.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 12,
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
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: secprimary,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
