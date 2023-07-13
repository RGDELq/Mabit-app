import 'package:flutter/foundation.dart';
import '../models/property_model.dart';

class FavoritesProvider with ChangeNotifier {
  List<PropertyModel> _favorites = [];

  List<PropertyModel> get favorites => _favorites;

  void addToFavorites(PropertyModel property) {
    _favorites.add(property);
    notifyListeners();
  }

  void removeFromFavorites(PropertyModel property) {
    _favorites.remove(property);
    notifyListeners();
  }

  bool isFavorite(PropertyModel property) {
    return _favorites.contains(property);
  }
}
