import 'package:flutter/material.dart';
import 'package:mabitt/provider/dark_mode_provider.dart';
import 'package:mabitt/provider/property_provider.dart';
import 'package:mabitt/screens/search.dart';
import 'package:mabitt/screens/widgets/categories_list.dart';
import 'package:mabitt/screens/widgets/property_widget_onhome.dart';
import 'package:mabitt/utils/theme.dart';
import 'package:provider/provider.dart';
import '../models/property_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();
  bool _isCategoryVisible = true;

  @override
  void initState() {
    Provider.of<PropertyProvider>(context, listen: false).getCategories();
    Provider.of<PropertyProvider>(context, listen: false).getProperties();

    _scrollController.addListener(() {
      if (_scrollController.offset > 100 && _isCategoryVisible) {
        setState(() {
          _isCategoryVisible = false;
        });
      } else if (_scrollController.offset <= 100 && !_isCategoryVisible) {
        setState(() {
          _isCategoryVisible = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dakmode = Provider.of<DarkModeProvider>(context);
    return Consumer<PropertyProvider>(
        builder: (context, propertyConsumer, child) {
      return Scaffold(
        backgroundColor: dakmode.isDark ? darkcolor : secprimary,
        body: Builder(
          builder: (context) {
            if (_currentIndex == 0) {
              return SafeArea(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      controller: _scrollController,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      "Welcome to Mabit",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: dakmode.isDark ? white : primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SearchScreen()));
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: dakmode.isDark
                                          ? secprimary
                                          : secprimary,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    height: 55,
                                    width: 50,
                                    child: const Icon(
                                      Icons.search_outlined,
                                    )),
                              ),
                            ),
                            Text(
                              "Categories",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: dakmode.isDark ? white : primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Visibility(
                              visible: _isCategoryVisible,
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1 / 0.4,
                                ),
                                itemCount: propertyConsumer.categories.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CategoryButton(
                                      categoryModel:
                                          propertyConsumer.categories[index]);
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Recommendations",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: dakmode.isDark ? white : primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: propertyConsumer.properties.length,
                              itemBuilder: (BuildContext context, int index) {
                                final PropertyModel propertyModel =
                                    propertyConsumer.properties[index];
                                return Column(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          22,
                                      child: RecommendationCard(
                                          propertyModel: propertyModel),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                );
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      );
    });
  }
}
