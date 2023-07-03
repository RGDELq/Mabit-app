import 'package:flutter/material.dart';

import '../models/property_model.dart';

class SearchResultsScreen extends StatefulWidget {
  @override
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  String _searchQuery = '';
  String _filter = 'price';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (query) {
            setState(() {
              _searchQuery = query;
            });
          },
          decoration: const InputDecoration(
            hintText: 'Search properties',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              _showFilterDialog();
            },
          ),
        ],
      ),
      body: _buildSearchResults(),
    );
  }

  List<PropertyModel> _getFilteredProperties() {
    if (_searchQuery.isNotEmpty) {
      properties = properties
          .where((property) =>
              property.title.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
    if (_filter == 'price') {
      properties.sort((a, b) => a.price.compareTo(b.price));
    } else if (_filter == 'floor') {
      properties.sort((a, b) => a.floors.compareTo(b.floors));
    } else if (_filter == 'rooms') {
      properties.sort((a, b) => a.rooms.compareTo(b.rooms));
    }
    return properties;
  }

  Widget _buildSearchResults() {
    List<PropertyModel> filteredProperties = _getFilteredProperties();
    return ListView.builder(
      itemCount: filteredProperties.length,
      itemBuilder: (BuildContext context, int index) {
        PropertyModel property = filteredProperties[index];
        return ListTile(
          title: Text(property.title),
          subtitle: Text('Price: ${property.price}'),
          onTap: () {
            // TODO: Navigate to property details screen
          },
        );
      },
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Filter search results'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: const Text('Price'),
                value: 'price',
                groupValue: _filter,
                onChanged: (value) {
                  setState(() {
                    _filter = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Floor'),
                value: 'floor',
                groupValue: _filter,
                onChanged: (value) {
                  setState(() {
                    _filter = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Rooms'),
                value: 'rooms',
                groupValue: _filter,
                onChanged: (value) {
                  setState(() {
                    _filter = value!;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
