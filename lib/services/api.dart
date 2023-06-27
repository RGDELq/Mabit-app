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
      print("GET ON : url'");
    }
    Response response = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${prefs.getString("token")}",
        'Accept': "application/json",
        'content-type': 'application/json',
      },
    );

    if (kDebugMode) {
      print("GET RES : ${response.statusCode}");
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
      print("POST ON :$url ");
      print("POST BODY :$body ");
    }
    Response response =
        await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
      HttpHeaders.authorizationHeader: "Bearer ${prefs.getString("token")}",
      'Accept': "application/json",
      'content-type': 'application/json',
    });
    if (response.statusCode == 401) {}
    if (kDebugMode) {
      print("POST RES : ${response.statusCode}");
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
      print("PUT ON : url'");
    }
    Response response =
        await http.put(Uri.parse('$url'), body: jsonEncode(body), headers: {
      HttpHeaders.authorizationHeader: "Bearer ${prefs.getString("token")}",
      'Accept': "application/json",
      'content-type': 'application/json',
    });
    if (response.statusCode == 401) {}
    if (kDebugMode) {
      print("PUT RES : ${response.statusCode}");
      print("PUT RES : ${response.body}}");
    }
    return response;
  }

  Future<Response> delete(
    String url,
    Map body,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (kDebugMode) {
      print("DELETE ON : url'");
    }
    Response response =
        await http.delete(Uri.parse('$url'), body: jsonEncode(body), headers: {
      HttpHeaders.authorizationHeader: "Bearer ${prefs.getString("token")}",
      'Accept': "application/json",
      'content-type': 'application/json',
    });
    if (response.statusCode == 401) {}
    if (kDebugMode) {
      print("DELETE RES : ${response.statusCode}");
      print("DELETE RES : ${response.body}}");
    }
    return response;
  }
}
