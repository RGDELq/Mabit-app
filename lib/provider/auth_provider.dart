import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mabitt/models/user_model.dart';
import 'package:mabitt/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  // // }
  // Future<bool> login(Map body) async {
  //   try {
  //     final response = await api.post('/api/login', body);

  //     if (response.statusCode == 200) {
  //       print('login successful');
  //       return true;
  //     } else {
  //       print('login failed');
  //       return false;
  //     }
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }
  Future<bool> login(Map body) async {
    try {
      final response = await api.post('/api/login', body);

      if (response.statusCode == 200) {
        final email =
            body['email']; // Get the email value from the request body
        final password =
            body['password']; // Get the password value from the request body

        final prefs = await SharedPreferences.getInstance();
        prefs.setString('email', email);
        prefs.setString('password', password);

        print('login successful');
        return true;
      } else {
        print('login failed');
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  /////////////////////////// GET  USER DATA////////////
  Future<void> clearLoginInfo() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    prefs.remove('password');
  }

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
