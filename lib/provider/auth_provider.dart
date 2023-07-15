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

///////////////////////////////////// Reqister/////////////////////////////////////////////////

  register(Map body) async {
    print("body: " + body.toString());
    setloading(true);

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
