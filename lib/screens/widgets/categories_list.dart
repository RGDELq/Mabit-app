import 'package:flutter/material.dart';
import 'package:mabitt/models/category_model.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_mode_provider.dart';
import '../../utils/theme.dart';
import '../category_screen.dart';

class CategoryButton extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryButton({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dakmode = Provider.of<DarkModeProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(
              categoryModel: categoryModel,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: dakmode.isDark ? secprimary : primary.withOpacity(0.10),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              categoryModel.name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            // Flexible(
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(12),
            //     child: Image(
            //       height: 50,
            //       width: 50,
            //       image: AssetImage('images/${categoryModel.assetPath}'),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
