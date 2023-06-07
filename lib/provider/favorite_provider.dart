// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../models/property_model.dart';

// class FavoriteProvider extends ChangeNotifier {
//   List<String> PropertyModell = [];
//   List<String> get PropertyModel => PropertyModell;

//   void toggleFavorite(String word) {
//     final isExist = PropertyModell.contains(word);
//     if (isExist) {
//       PropertyModell.remove(PropertyModel);
//     } else {
//       PropertyModell.add(PropertyModel as String);
//     }
//     notifyListeners();
//   }

//   bool isExist(String index) {
//     final isExist = PropertyModell.contains(index);
//     return isExist;
//   }

//   void clearFavorite() {
//     PropertyModell = [];
//     notifyListeners();
//   }

//   static FavoriteProvider of(
//     BuildContext context, {
//     bool listen = true,
//   }) {
//     return Provider.of<FavoriteProvider>(
//       context,
//       listen: listen,
//     );
//   }
// }