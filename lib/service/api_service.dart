import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jsonplaceholder/model/albums.dart';
import 'package:jsonplaceholder/model/comments.dart';
import 'package:jsonplaceholder/model/photos.dart';
import 'package:jsonplaceholder/model/posts.dart';
import 'package:jsonplaceholder/model/users.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  // Endpoint Albums
  static Future<List<Albums>> fetchAlbums() async {
    final response = await http.get(Uri.parse('$baseUrl/albums'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .map((json) => Albums.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Gagal memuat albums (HTTP ${response.statusCode})');
    }
  }

  // Endpoint Comments
  static Future<List<Comments>> fetchComments() async {
    final response = await http.get(Uri.parse('$baseUrl/comments'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .map((json) => Comments.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Gagal memuat comments (HTTP ${response.statusCode})');
    }
  }

  // Endpoint Photos
  static Future<List<Photos>> fetchPhotos() async {
    final response = await http.get(Uri.parse('$baseUrl/photos'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .map((json) => Photos.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Gagal memuat photos (HTTP ${response.statusCode})');
    }
  }

  // Endpoint Posts
  static Future<List<Posts>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .map((json) => Posts.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Gagal memuat posts (HTTP ${response.statusCode})');
    }
  }

  // Endpoint Users
  static Future<List<Users>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .map((json) => Users.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Gagal memuat users (HTTP ${response.statusCode})');
    }
  }
}
