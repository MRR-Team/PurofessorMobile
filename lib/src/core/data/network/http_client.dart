import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:purofessor_mobile/src/core/exceptions/http_exception.dart';
import 'package:purofessor_mobile/src/core/exceptions/no_internet_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpClient {
  final String baseUrl;
  final http.Client _client;

  HttpClient({required this.baseUrl, http.Client? client})
    : _client = client ?? http.Client();

  Future<dynamic> get(String path, {Map<String, String>? headers}) async {
    try {
      final response = await _client.get(
        Uri.parse('$baseUrl$path'),
        headers: await _defaultHeaders(headers),
      );
      return _handleResponse(response);
    } on SocketException {
      throw NoInternetException();
    }
  }

  Future<dynamic> post(
    String path, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    try {
      final response = await _client.post(
        Uri.parse('$baseUrl$path'),
        headers: await _defaultHeaders(headers),
        body: json.encode(body),
      );
      return _handleResponse(response);
    } on SocketException {
      throw NoInternetException();
    }
  }

  Future<dynamic> put(
    String path, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final response = await _client.put(
      Uri.parse('$baseUrl$path'),
      headers: await _defaultHeaders(headers),
      body: json.encode(body),
    );
    return _handleResponse(response);
  }

  Future<dynamic> delete(String path, {Map<String, String>? headers}) async {
    final response = await _client.delete(
      Uri.parse('$baseUrl$path'),
      headers: await _defaultHeaders(headers),
    );
    return _handleResponse(response);
  }

  Future<Map<String, String>> _defaultHeaders([
    Map<String, String>? custom,
  ]) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
      ...?custom,
    };

    return headers;
  }

  dynamic _handleResponse(http.Response response) {
    dynamic responseBody;
    try {
      if (response.body.isNotEmpty) {
        responseBody = json.decode(response.body);
      }
    } catch (e) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body;
      } else {
        throw HttpException(
          message:
              'Error: ${response.statusCode}. Could not parse error details.',
          statusCode: response.statusCode,
        );
      }
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return responseBody;
    } else {
      final errorMessage =
          (responseBody is Map && responseBody.containsKey('message'))
              ? responseBody['message']
              : (response.reasonPhrase ?? 'Server error');
      throw HttpException(
        message: errorMessage,
        statusCode: response.statusCode,
      );
    }
  }
}
