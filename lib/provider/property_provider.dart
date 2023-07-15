import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mabitt/models/category_model.dart';
import 'package:mabitt/models/rating_model.dart';

import '../models/property_model.dart';
import '../services/api.dart';

class PropertyProvider with ChangeNotifier {
  Api api = Api();
  List<PropertyModel> allProperties = [];

  String _searchQuery = '';
  String _filter = 'price';
  List<CategoryModel> categories = [];
  List<PropertyModel> properties = [];
  List<RatingModel> comments = [];
  getCategories() async {
    final response = await api.get('/api/category', {});

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      categories.clear();
      decodedData.forEach((x) => categories.add(CategoryModel.fromJson(x)));
      // for (var x in decodedData) {
      //   categories.add(CategoryModel.fromJson(x));
      // }

      // categories= decodedData.map((x) => CategoryModel.fromJson(x)).toList();
      notifyListeners();
    }
  }

  getProperties() async {
    final response = await api.get('/api/get', {});

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      properties.clear();
      decodedData.forEach((x) => properties.add(PropertyModel.fromJson(x)));
      // for (var x in decodedData) {
      //   categories.add(CategoryModel.fromJson(x));
      // }

      // categories= decodedData.map((x) => CategoryModel.fromJson(x)).toList();
      notifyListeners();
    }
  }

  ///////////////////////////////////////////////////////////
  getComments() async {
    final response = await api.get('/api/getrating', {});

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      comments.clear();
      decodedData.forEach((x) => comments.add(RatingModel.fromJson(x)));
      // for (var x in decodedData) {
      //   categories.add(CategoryModel.fromJson(x));
      // }

      // categories= decodedData.map((x) => CategoryModel.fromJson(x)).toList();
      notifyListeners();
    }
  }
  
/////////////////////////////////////////////////////////////

  addProperty(Map body) async {
    final response = await api.post('/api/create', {});

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      decodedData.forEach((x) => properties.add(PropertyModel.fromJson(x)));
      notifyListeners();
    }
    List<PropertyModel> getPropertiesByCategoryId(int categoryId) {
      return allProperties
          .where((property) => property.categoryId == categoryId)
          .toList();
    }

//////////////////////////////////// search critria//////////////
    getFilteredProperties() {
      if (_searchQuery.isNotEmpty) {
        ((property) =>
            property.title.toLowerCase().contains(_searchQuery.toLowerCase()));
      }
      if (_filter == 'price') {
        properties.sort((a, b) => a.price.compareTo(b.price));
      } else if (_filter == 'floor') {
        properties.sort((a, b) => a.floor.compareTo(b.floor));
      } else if (_filter == 'rooms') {
        properties.sort((a, b) => a.rooms.compareTo(b.rooms));
      }
      return properties;
    }

    Widget buildSearchResults() {
      List<PropertyModel> filteredProperties = getFilteredProperties();
      return ListView.builder(
        itemCount: filteredProperties.length,
        itemBuilder: (BuildContext context, int index) {
          PropertyModel property = filteredProperties[index];
          return ListTile(
            title: Text(property.name),
            subtitle: Text('Price: ${property.price}'),
            onTap: () {
              // TODO: Navigate to property details screen
            },
          );
        },
      );
    }
  }

  getPropertiesByCategoryId(int id) {}
}
