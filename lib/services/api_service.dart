import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ApiService {
  final String baseUrl = 'https://api.example.com'; // Replace with your API endpoint

  Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users'));
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }

  Future<User> getUserById(String id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users/$id'));
      
      if (response.statusCode == 200) {
        return User.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load user: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load user: $e');
    }
  }

  Future<void> createUser(User user) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/users'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(user.toJson()),
      );
      
      if (response.statusCode != 201) {
        throw Exception('Failed to create user: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }
} 