import 'package:flutter/foundation.dart';
import 'package:mabitt/services/api.dart';

class AuthProvider with ChangeNotifier {
  Api api = Api();
  bool loading = false;
  setloading(bool value) {
    loading = value;
    notifyListeners();
  }

///////////////////////////////////// Login /////////////////////////////////////////////////
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
    final response = await api.post('/api/login', body);
    if (response.statusCode == 200) {
      print('login successful');
      setloading(false);
    } else {
      setloading(false);

      print('failed to login');
    }

    setloading(false);
  }

///////////////////////////////////// Reqister/////////////////////////////////////////////////
  register(Map body) async {
    print("body: " + body.toString());
    setloading(true);

    // final response = await http.post(
    //     Uri.parse('http://127.0.0.1:8000/api/login'),
    //     body: jsonEncode(body),
    //     headers: {
    //       'Content-Type': 'application/json',
    //       'Accept': 'application/json'
    //     });#
    final response = await api.post('/api/register', body);
    if (response.statusCode == 200) {
      print('register successful');
      setloading(false);
    } else {
      setloading(false);

      print('failed to register');
    }

    setloading(false);
  }
}

// Future<List<dynamic>> getProperties() async {
//   final response = await http.get('http://10.0.2.2:8000/api/properties');
//   if (response.statusCode == 200) {
//     return json.decode(response.body);
//   } else {
//     throw Exception('Failed to load properties');
//   }
// }