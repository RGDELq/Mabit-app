import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mabitt/models/category_model.dart';

import '../services/api.dart';

class PropertyProvider with ChangeNotifier {
  Api api = Api();
  List<CategoryModel> categories = [];

  getCategories() async {
    final response = await api.get('/category', {});

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
}
