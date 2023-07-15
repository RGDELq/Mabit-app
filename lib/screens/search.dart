import 'package:flutter/material.dart';
import 'package:mabitt/provider/property_provider.dart';
import 'package:mabitt/screens/widgets/property_widget_onhome.dart';
import 'package:provider/provider.dart';

import '../models/property_model.dart';
import '../provider/dark_mode_provider.dart';
import '../utils/theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  int? _minPrice;
  int? _minFloor;
  int? _minRooms;

  @override
  Widget build(BuildContext context) {
    final propertyProvider = Provider.of<PropertyProvider>(context);
    final List<PropertyModel> properties = propertyProvider.properties;

    // Filter the properties based on the search criteria
    final filteredProperties = properties.where((property) {
      if (_minPrice != null && property.price < _minPrice!) {
        return false;
      }
      if (_minFloor != null && property.floor < _minFloor!) {
        return false;
      }
      if (_minRooms != null && property.rooms < _minRooms!) {
        return false;
      }
      return true;
    }).toList();

    // Sort the properties based on the selected sort order
    filteredProperties.sort((a, b) => a.price.compareTo(b.price));
    final dakmode = Provider.of<DarkModeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: dakmode.isDark ? primary : secprimary,
        centerTitle: true,
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Price',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _minPrice = int.tryParse(value);
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Floor',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _minFloor = int.tryParse(value);
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Rooms',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _minRooms = int.tryParse(value);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProperties.length,
              itemBuilder: (context, index) {
                final property = filteredProperties[index];
                return RecommendationCard(propertyModel: property);
              },
            ),
          ),
        ],
      ),
    );
  }
}
