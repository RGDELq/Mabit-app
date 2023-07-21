import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mabitt/models/user_model.dart';
import 'package:mabitt/services/api.dart';

class AuthProvider with ChangeNotifier {
  Api api = Api();
  bool loading = false;
  setloading(bool value) {
    loading = value;
    notifyListeners();
  }

  List<UserModel> users = [];

///////////////////////////////////// Login /////////////////////////////////////////////////
  // login(Map body) async {
  //   print("body: " + body.toString());
  //   setloading(true);

  //   final response = await api.post('/api/login', body);
  //   if (response.statusCode == 200) {
  //     print('login successful');
  //     setloading(false);
  //   } else {
  //     setloading(false);

  //     print('failed to login');
  //   }

  //   setloading(false);
  // }

  Future<void> login(Map body) async {
    print("body: " + body.toString());
    setloading(true);

    final response = await api.post('/api/login', body);

    if (response.statusCode == 200) {
      print('login successful');
      setloading(false);
    } else {
      setloading(false);
      throw Exception('Failed to login');
    }
  }
  /////////////////////////// GET  USER DATA////////////

  getserData() async {
    final response = await api.get('/api/getuserdata', {});

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      users.clear();
      decodedData.forEach((x) => users.add(UserModel.fromJson(x)));

      notifyListeners();
    }
  }

///////////////////////////////////// Reqister/////////////////////////////////////////////////

  Future<String?> register(Map body) async {
    print("body: " + body.toString());
    setloading(true);

    final response = await api.post('/api/register', body);
    if (response.statusCode == 200) {
      print('register successful');
      setloading(false);
      return null; // Registration successful, return null for no error message.
    } else if (response.statusCode == 422) {
      final errorResponse = jsonDecode(response.body);
      final errorMessage = errorResponse['errors']['email'][0];
      print('failed to register: $errorMessage');
      setloading(false);
      return errorMessage; // Return error message for a taken email.
    } else {
      print('failed to register');
      setloading(false);
      return 'An error occurred while registering. Please try again later.'; // Return a general error message for other errors.
    }
// }
//   register(Map body) async {
//     print("body: " + body.toString());
//     setloading(true);

//     final response = await api.post('/api/register', body);
//     if (response.statusCode == 200) {
//       print('register successful');
//       setloading(false);
//     } else {
//       setloading(false);

//       print('failed to register');
//     }

//     setloading(false);
//   }
  }
}
