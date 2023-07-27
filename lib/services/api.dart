import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import '../utils/my_string.dart';

class Api {
  Future<Response> get(String url, Map body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (kDebugMode) {
      print("GET ON : $baseUrl$url");
      print("GET BODY : $body");
    }
    Response response = await http.get(
      Uri.parse(baseUrl + url),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${prefs.getString("token")}",
        'Accept': "application/json",
        'content-type': 'application/json',
      },
    );
    print(response);
    if (response.statusCode == 401) {
      String? tok = prefs.getString("token");
      if (tok != null) {
        var refreshed = await refreshToken();

        if (refreshed.first) {
          return get(url, body);
        } else {}
      }
    } else {}
    if (kDebugMode) {
      print("GET STATUS : ${response.statusCode}");

      print("GET RES : ${response.body}");
    }

    return response;
  }

  Future<Response> post(
    String url,
    Map body,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (kDebugMode) {
      print("POST ON : $baseUrl$url");
      print("POST BODY : $body");
    }
    Response response = await http
        .post(Uri.parse(baseUrl + url), body: jsonEncode(body), headers: {
      HttpHeaders.authorizationHeader: "Bearer ${prefs.getString("token")}",
      'Accept': "application/json",
      'content-type': 'application/json',
    });
    if (response.statusCode == 401) {
      String? tok = prefs.getString("token");
      if (tok != null) {
        var refreshed = await refreshToken();
        if (refreshed.first) {
          return post(url, body);
        } else {}
      }
    }
    if (kDebugMode) {
      print("POST STATUS : ${response.statusCode}");
      print("POST RES : ${response.body}");
    }
    return response;
  }

  Future<Response> put(
    String url,
    Map body,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (kDebugMode) {
      print("PUT ON : $baseUrl$url");
      print("PUT BODY : $body");
    }
    Response response = await http
        .put(Uri.parse(baseUrl + url), body: jsonEncode(body), headers: {
      HttpHeaders.authorizationHeader: "Bearer ${prefs.getString("token")}",
      'Accept': "application/json",
      'content-type': 'application/json',
    });
    if (response.statusCode == 401) {
      String? tok = prefs.getString("token");
      if (tok != null) {
        var refreshed = await refreshToken();
        if (refreshed.first) {
          return put(url, body);
        } else {}
      }
    }
    if (kDebugMode) {
      print("PUT STATUS : ${response.statusCode}");
      print("PUT RES : ${response.body}");
    }
    return response;
  }

  Future<Response> delete(
    String url,
    Map body,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (kDebugMode) {
      print("DELETE ON : $baseUrl$url");
      print("DELETE BODY : $body");
    }
    Response response = await http
        .delete(Uri.parse(baseUrl + url), body: jsonEncode(body), headers: {
      HttpHeaders.authorizationHeader: "Bearer ${prefs.getString("token")}",
      'Accept': "application/json",
      'content-type': 'application/json',
    });
    if (response.statusCode == 401) {
      String? tok = prefs.getString("token");
      if (tok != null) {
        var refreshed = await refreshToken();
        if (refreshed.first) {
          return delete(url, body);
        } else {}
      }
    }
    if (kDebugMode) {
      print("DELETE STATUS : ${response.statusCode}");
      print("DELETE RES : ${response.body}");
    }
    return response;
  }

  Future<List> refreshToken() async {
    bool refreshed = false;

    var response = await post("/user/refresh-token", {});

    if (kDebugMode) {
      print("REFRESH RES API: ${response.body.toString()}");
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (response.statusCode == 200) {
      if (response.body.toString().contains("access_token")) {
        await prefs.setString(
            "token", json.decode(response.body.toString())["access_token"]);
        refreshed = true;
      }
    } else {
      refreshed = false;

      prefs.clear();
    }
    return [refreshed, response];
  }

  Future<Response> upload(File file, Map<dynamic, dynamic> body) async {
    if (kDebugMode) {
      print("PATH FROM UPLOAD IS : ${file.path.toString()}");
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    var postUri = Uri.parse("$baseUrl/api/create");

    http.MultipartRequest request = http.MultipartRequest(
      "POST",
      postUri,
    );

    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
      'image',
      file.path,
    );
    request.headers['Authorization'] = 'Bearer $token';
    request.headers['content-type'] = 'multipart/form-data';
    request.headers['Accept'] = 'application/json';
    // Convert the body map to a Map<String, String>
    Map<String, String> stringMap =
        body.map((key, value) => MapEntry(key.toString(), value.toString()));
    request.fields.addAll(stringMap);
    request.files.add(multipartFile);

    StreamedResponse response = await request.send();

    return Response.fromStream(response);
  }
}
