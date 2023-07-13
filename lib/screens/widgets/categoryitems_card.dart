import 'package:flutter/material.dart';
import 'package:mabitt/utils/theme.dart';
import 'package:provider/provider.dart';

import '../../models/property_model.dart';
import '../../provider/dark_mode_provider.dart';
import '../../utils/my_string.dart';
import '../details_screen.dart';

class ExpandedRecommendationCard extends StatelessWidget {
  const ExpandedRecommendationCard({
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
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(right: 8, top: 12, bottom: 12),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              // child: Image(
              //   height: 200,
              //   width: double.infinity,
              //   image: AssetImage(propertyModel.name),
              //   fit: BoxFit.cover,
              // ),
              child: Image.network(
                // height: 120,
                width: double.maxFinite,
                // "${baseUrl.replaceAll('/api', '')}/img/" + propertyModel.image,

                "${baseUrl}/img/" + propertyModel.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  propertyModel.name,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                // const Icon(
                //   LineIcons.starAlt,
                //   color: Colors.amber,
                // ),
                // Text(
                //   propertyModel.rating.toString(),
                //   style: Theme.of(context).textTheme.titleMedium!.copyWith(
                //         fontWeight: FontWeight.bold,
                //       ),
                // ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "${propertyModel.rooms} rooms - ${propertyModel.rooms} square foots - ${propertyModel.floor} floors",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 16.0),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: GestureDetector(
            //           onTap: () {},
            //           child: Container(
            //             padding: const EdgeInsets.all(12),
            //             margin: const EdgeInsets.only(right: 8),
            //             decoration: BoxDecoration(
            //               color: dakmode.isDark ? secprimary : primary,
            //               borderRadius: BorderRadius.circular(12),
            //               border: Border.all(
            //                 color: Colors.black.withOpacity(0.1),
            //               ),
            //               boxShadow: [
            //                 BoxShadow(
            //                   color: Colors.black.withOpacity(0.1),
            //                   offset: const Offset(0, 5),
            //                   blurRadius: 20,
            //                   spreadRadius: 4,
            //                 )
            //               ],
            //             ),
            //             height: 55,
            //             width: 55,
            //             child: Center(
            //               child: Text(
            //                 "Check",
            //                 style: Theme.of(context)
            //                     .textTheme
            //                     .titleSmall!
            //                     .copyWith(
            //                       color: dakmode.isDark ? darkcolor : white,
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       // GestureDetector(
            //       //   onTap: () {},
            //       //   child: Container(
            //       //     padding: const EdgeInsets.all(12),
            //       //     margin: const EdgeInsets.only(right: 8),
            //       //     decoration: BoxDecoration(
            //       //       color: Colors.white,
            //       //       borderRadius: BorderRadius.circular(12),
            //       //       border: Border.all(
            //       //         color: Colors.black.withOpacity(0.1),
            //       //       ),
            //       //       boxShadow: [
            //       //         BoxShadow(
            //       //           color: Colors.black.withOpacity(0.1),
            //       //           offset: const Offset(0, 5),
            //       //           blurRadius: 20,
            //       //           spreadRadius: 4,
            //       //         )
            //       //       ],
            //       //     ),
            //       //     height: 55,
            //       //     width: 55,
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
