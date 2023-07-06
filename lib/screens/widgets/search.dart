// //////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:mabitt/provider/property_provider.dart';
// import 'package:mabitt/screens/widgets/categorytypes_card.dart';
// import 'package:mabitt/screens/widgets/property_widget.dart';
// import 'package:provider/provider.dart';

// import '../../models/property_model.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _currentIndex = 0;
//   String _searchQuery = '';
//   int? _minRooms;
//   int? _maxRooms;
//   int? _minFloors;
//   int? _maxFloors;
//   int? _minPrice;
//   int? _maxPrice;

//   List<PropertyModel> _filteredProperties =  propertyConsumer.properties;

//   void _filterProperties() {
//     setState(() {
//       _filteredProperties = properties.where((property) {
//         bool matchesSearchQuery =
//             property.title.toLowerCase().contains(_searchQuery.toLowerCase());
//         bool matchesRoomsFilter =
//             (_minRooms == null || property.rooms >= _minRooms!) &&
//                 (_maxRooms == null || property.rooms <= _maxRooms!);
//         bool matchesFloorsFilter =
//             (_minFloors == null || property.floors >= _minFloors!) &&
//                 (_maxFloors == null || property.floors <= _maxFloors!);
//         bool matchesPriceFilter =
//             (_minPrice == null || property.price >= _minPrice!) &&
//                 (_maxPrice == null || property.price <= _maxPrice!);
//         return matchesSearchQuery &&
//             matchesRoomsFilter &&
//             matchesFloorsFilter &&
//             matchesPriceFilter;
//       }).toList();
//     });
//   }

//   @override
//   void initState() {
//     Provider.of<PropertyProvider>(context, listen: false).getCategories();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<PropertyProvider>(
//         builder: (context, propertyConsumer, child) {
//       return Scaffold(
//         backgroundColor: const Color.fromARGB(255, 219, 232, 216),
//         body: Builder(builder: (context) {
//           if (_currentIndex == 0) {
//             return SingleChildScrollView(
//               child: SafeArea(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Welcome to Mabit",
//                                 style: Theme.of(context).textTheme.titleLarge,
//                               ),
//                             ],
//                           ),
//                           const Spacer(),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 4,
//                           horizontal: 8,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: GestureDetector(
//                           onTap: () async {
//                             final searchQuery = await showSearch<String>(
//                               context: context,
//                               delegate: PropertySearch(),
//                             );
//                             if (searchQuery != null) {
//                               setState(() {
//                                 _searchQuery = searchQuery;
//                               });
//                               _filterProperties();
//                             }
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(12),
//                             decoration: BoxDecoration(
//                               color: const Color.fromARGB(255, 219, 232, 216),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             height: 55,
//                             width: 55,
//                             child: const Icon(
//                               LineIcons.search,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             child: FilterButton(
//                               label: 'Rooms',
//                               min: _minRooms,
//                               max: _maxRooms,
//                               onChanged: (min, max) {
//                                 setState(() {
//                                   _minRooms = min;
//                                   _maxRooms = max;
//                                 });
//                                 _filterProperties();
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 16),
//                           Expanded(
//                             child: FilterButton(
//                               label: 'Floors',
//                               min: _minFloors,
//                               max: _maxFloors,
//                               onChanged: (min, max) {
//                                 setState(() {
//                                   _minFloors = min;
//                                   _maxFloors = max;
//                                 });
//                                 _filterProperties();
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 16),
//                           Expanded(
//                             child: FilterButton(
//                               label: 'Price',
//                               min: _minPrice,
//                               max: _maxPrice,
//                               onChanged: (min, max) {
//                                 setState(() {
//                                   _minPrice = min;
//                                   _maxPrice = max;
//                                 });
//                                 _filterProperties();
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       GridView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           childAspectRatio: 1 / 0.4,
//                         ),
//                         itemCount: propertyConsumer.categories.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return CategoryButton(
//                               categoryModel:
//                                   propertyConsumer.categories[index]);
//                         },
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Text(
//                         "Recommendations",
//                         style: Theme.of(context).textTheme.titleLarge,
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       SizedBox(
//                         height: 290,
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           shrinkWrap: true,
//                           itemCount: _filteredProperties.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             final PropertyModel propertyModel =
//                                 _filteredProperties[index];
//                             return RecommendationCard(
//                                 propertyModel: propertyModel);
//                           },
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }
//           return const SizedBox();
//         }),
//       );
//     });
//   }
// }

// class FilterButton extends StatelessWidget {
//   const FilterButton({
//     Key? key,
//     required this.label,
//     required this.min,
//     required this.max,
//     required this.onChanged,
//   }) : super(key: key);

//   final String label;
//   final int? min;
//   final int? max;
//   final Function(int?, int?) onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         vertical: 4,
//         horizontal: 8,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(label),
//           const SizedBox(height: 8),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(min?.toString() ?? 'min'),
//               Text(max?.toString() ?? 'max'),
//             ],
//           ),
//           const SizedBox(height: 8),
//           RangeSlider(
//             values: RangeValues(
//               min?.toDouble() ?? 0,
//               max?.toDouble() ?? 100,
//             ),
//             min: 0,
//             max: 100,
//             onChanged: (values) {
//               onChanged(values.start.toInt(), values.end.toInt());
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PropertySearch extends SearchDelegate<String> {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, '');
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // This method is not used in this example
//     return const SizedBox.shrink();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final List<String> suggestions =
//         propertyConsumer.properties.map((property) => property.title).toList();
//     final filteredSuggestions = suggestions
//         .where((suggestion) =>
//             suggestion.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//     return ListView.builder(
//       itemCount: filteredSuggestions.length,
//       itemBuilder: (BuildContext context, int index) {
//         final suggestion = filteredSuggestions[index];
//         return ListTile(
//           title: Text(suggestion),
//           onTap: () {
//             close(context, suggestion);
//           },
//         );
//       },
//     );
//   }
// }
