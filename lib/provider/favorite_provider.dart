import 'package:flutter/material.dart';

import '../models/property_model.dart';

class FavoriteProvider with ChangeNotifier {
  List<PropertyModel> _favoriteProperties = [];

  List<PropertyModel> get favoriteProperties => _favoriteProperties;

  set favoriteProperties(List<PropertyModel> value) {
    _favoriteProperties = value;
    notifyListeners();
  }

  void addFavoriteProperty(PropertyModel property) {
    _favoriteProperties.add(property);
    notifyListeners();
  }

  void removeFavoriteProperty(PropertyModel property) {
    _favoriteProperties.remove(property);
    notifyListeners();
  }

  bool isFavorite(PropertyModel property) {
    return _favoriteProperties.contains(property);
  }
}
