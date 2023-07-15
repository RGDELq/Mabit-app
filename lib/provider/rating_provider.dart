import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mabitt/models/rating_model.dart';

import '../services/api.dart';

class RatingProvider with ChangeNotifier {
  Api api = Api();

  List<RatingModel> comments = [];
  getComments() async {
    final response = await api.get('/api/getrating', {});

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      comments.clear();
      decodedData.forEach((x) => comments.add(RatingModel.fromJson(x)));

      notifyListeners();
    }
  }

  addcomment(Map body) async {
    print("body: " + body.toString());

    final response = await api.post('/api/createrating', body);
    if (response.statusCode == 200) {
      print('comment added successful');
    } else {
      print('failed to add comment');
    }
  }

}
