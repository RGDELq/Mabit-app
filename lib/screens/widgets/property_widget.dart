import 'package:flutter/material.dart';
import 'package:mabitt/utils/my_string.dart';
import '../../models/property_model.dart';
import '../details_screen.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    Key? key,
    required this.propertyModel,
  }) : super(key: key);

  final PropertyModel propertyModel;

  @override
  Widget build(BuildContext context) {
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ClipRRect(

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
                color: const Color.fromARGB(255, 219, 232, 216),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "Check",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            // const SizedBox(
            //   height: 6,
            // ),
            Text(
              propertyModel.name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            // const SizedBox(
            //   height: 9,
            // ),
            Text(
              "${propertyModel.rooms} rooms - ${propertyModel.rooms} square foots - ${propertyModel.floor} floors",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
