import 'dart:convert';

import "package:http/http.dart" as http;

import 'package:flutter/foundation.dart';
import 'package:mabitt/services/api.dart';

class AuthProvider with ChangeNotifier {
  Api api = Api();
  bool loading = false;
  setloading(bool value) {
    loading = value;
    notifyListeners();
  }

  login(Map body) async {
    print("body: " + body.toString());
    setloading(true);

    // final response = await http.post(
    //     Uri.parse('http://127.0.0.1:8000/api/login'),
    //     body: jsonEncode(body),
    //     headers: {
    //       'Content-Type': 'application/json',
    //       'Accept': 'application/json'
    //     });#
    final response = await api.post('http://10.0.2.2:8000/api/login', body);
    if (response.statusCode == 200) {
      print('login successful');
      setloading(false);
    } else {
      setloading(false);

      print('failed to login');
    }

    setloading(false);
  }
}

// Future<void> _login() async {
//   String url = 'http://127.0.0.1:8000/api/login';
//   Map<String, String> headers = {'Content-Type': 'application/json'};
//   String body = '{"username": "${_usernameController.text}", "password": "${_passwordController.text}"}';

//   http.Response response = await http.post(Uri.parse(url), headers: headers, body: body);

//   if (response.statusCode == 200) {
//     // Login successful, navigate to the next screen
//     Navigator.pushNamed(context, '/home');
//   } else {
//     // Login failed, show error message
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text('Login failed'),
//     ));
//   }
