import 'package:flutter/material.dart';
import 'package:mabitt/models/category_model.dart';
import 'package:mabitt/provider/dark_mode_provider.dart';
import 'package:mabitt/provider/property_provider.dart';
import 'package:mabitt/screens/widgets/categoryitems_card.dart';
import 'package:mabitt/utils/theme.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  final CategoryModel categoryModel;
  const CategoryPage({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    Provider.of<PropertyProvider>(context, listen: false).getProperties();
    Provider.of<PropertyProvider>(context, listen: false).getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dakmode = Provider.of<DarkModeProvider>(context);
    return Consumer<PropertyProvider>(
      builder: (context, propertyConsumer, child) {
        final properties = propertyConsumer.properties.where(
            (property) => property.categoryId == widget.categoryModel.id);
        return Scaffold(
          backgroundColor: dakmode.isDark ? darkcolor : secprimary,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),
                        Text(
                          widget.categoryModel.name,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: dakmode.isDark ? white : darkGrey,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: dakmode.isDark ? white : darkGrey,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    properties.isEmpty
                        ? const Center(
                            child: Text("No properties found"),
                          )
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: properties.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ExpandedRecommendationCard(
                                propertyModel: properties.elementAt(index),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
