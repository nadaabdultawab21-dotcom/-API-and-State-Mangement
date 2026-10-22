import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/post.dart';

class PostService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> fetchPosts() async {
    final uri = Uri.parse('$_baseUrl/posts');

    final response = await http
        .get(uri, headers: {'Accept': 'application/json'})
        .timeout(const Duration(seconds: 15));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body) as List<dynamic>;
      return decoded
          .map((item) => Post.fromJson(item as Map<String, dynamic>))
          .toList();
    }

    throw Exception('Could not load posts (HTTP ${response.statusCode}).');
  }
}
