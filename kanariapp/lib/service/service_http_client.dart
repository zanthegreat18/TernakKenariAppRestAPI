import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ServiceHttpClient {
  final String baseUrl = 'https://10.0.0.2:8000/api';
  final secureStorage = FlutterSecureStorage();

  //post
  Future<http.Response> post(String endpoint, Map<String, String> body) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    try {
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      return response;
    } catch (e) {
      throw Exception("POST request failed: $e");
    }
  }

  //post with token
  Future<http.Response> postWithToken(
    String endpoint,
    Map<String, String> body,
  ) async {
    final token = await secureStorage.read(key: 'token');
    final url = Uri.parse('$baseUrl/$endpoint');
    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      return response;
    } catch (e) {
      throw Exception("POST request failed: $e");
    }
  }

  //get
  Future<http.Response> get(String endpoint) async {
    final token = await secureStorage.read(key: 'token');
    final url = Uri.parse('$baseUrl/$endpoint');
    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      return response;
    } catch (e) {
      throw Exception("GET request failed: $e");
    }
  }

  //put
  Future<http.Response> put(String endpoint, Map<String, String> body) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    try {
      final response = await http.put(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
      return response;
    } catch (e) {
      throw Exception("PUT request failed: $e");
    }
  }

  //delete
  Future<http.Response> delete(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    try {
      final response = await http.delete(url);
      return response;
    } catch (e) {
      throw Exception("DELETE request failed: $e");
    }
  }
}
