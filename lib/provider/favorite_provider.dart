// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class FavoriteProvider extends ChangeNotifier {
//   List<String> propertyModell = [];
//   List<String> get propertyModel => propertyModell;

//   void toggleFavorite(String word) {
//     final isExist = propertyModell.contains(word);
//     if (isExist) {
//       propertyModell.remove(propertyModel);
//     } else {
//       propertyModell.add(propertyModel as String);
//     }
//     notifyListeners();
//   }

//   bool isExist(String index) {
//     final isExist = propertyModell.contains(index);
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
