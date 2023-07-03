// // import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:mabitt/screens/search.dart';
// import 'package:mabitt/screens/widgets/category_widget.dart';
// import 'package:mabitt/screens/widgets/property_widget.dart';
// import '../models/category_model.dart';
// import '../models/property_model.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final int _currentIndex = 0;
//   final ScrollController _scrollController = ScrollController();
//   bool _isCategoryVisible = true;

//   @override
//   void initState() {
//     _scrollController.addListener(() {
//       if (_scrollController.offset > 100 && _isCategoryVisible) {
//         setState(() {
//           _isCategoryVisible = false;
//         });
//       } else if (_scrollController.offset <= 100 && !_isCategoryVisible) {
//         setState(() {
//           _isCategoryVisible = true;
//         });
//       }
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 219, 232, 216),
//       body: Builder(
//         builder: (context) {
//           // your conditions to render the widgets!
//           if (_currentIndex == 0) {
//             return SafeArea(
//               child: Stack(
//                 children: [
//                   SingleChildScrollView(
//                     controller: _scrollController,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Welcome to Mabit",
//                                     style: Theme.of(context).textTheme.titleLarge,
//                                   ),
//                                 ],
//                               ),
//                               const Spacer(),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                               vertical: 4,
//                               horizontal: 8,
//                             ),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             SearchResultsScreen()));
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.all(12),
//                                 decoration: BoxDecoration(
//                                   color: const Color.fromARGB(255, 219, 232, 216),
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 height: 55,
//                                 width: 55,
//                                 child: const Icon(
//                                   LineIcons.search,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           Visibility(
//                             visible: _isCategoryVisible,
//                             child: GridView.builder(
//                               shrinkWrap: true,
//                               physics: const NeverScrollableScrollPhysics(),
//                               gridDelegate:
//                                   const SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 3, // modified from 2 to 3
//                                 childAspectRatio: 1 / 0.4,
//                               ),
//                               itemCount: categories.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return CategoryButton(
//                                     categoryModel: categories[index]);
//                               },
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           Text(
//                             "Recommendations",
//                             style: Theme.of(context).textTheme.titleLarge,
//                           ),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           ListView.builder(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemCount: properties.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               final PropertyModel propertyModel = properties[index];
//                               return Column(
//                                 children: [
//                                   RecommendationCard(propertyModel: propertyModel),
//                                   const SizedBox(height: 20),
//                                 ],
//                               );
//                             },
//                           ),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }
//           return const SizedBox();
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mabitt/provider/property_provider.dart';
import 'package:mabitt/screens/search.dart';
import 'package:mabitt/screens/widgets/categorytypes_card.dart';
import 'package:mabitt/screens/widgets/property_widget.dart';
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
    return Consumer<PropertyProvider>(
        builder: (context, propertyConsumer, child) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 219, 232, 216),
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
                            const Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      "Welcome to Mabit",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 44, 73, 121),
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
                                              SearchResultsScreen()));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 219, 232, 216),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  height: 55,
                                  width: 55,
                                  child: const Icon(
                                    LineIcons.search,
                                  ),
                                ),
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
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: properties.length,
                              itemBuilder: (BuildContext context, int index) {
                                final PropertyModel propertyModel =
                                    properties[index];
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
