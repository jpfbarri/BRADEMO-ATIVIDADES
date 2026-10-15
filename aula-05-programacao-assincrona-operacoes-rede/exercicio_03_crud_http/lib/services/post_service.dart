import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/post.dart';

class PostService {
  PostService({http.Client? client}) : _client = client ?? http.Client();

  static const _baseUrl = 'https://jsonplaceholder.typicode.com/posts';
  final http.Client _client;

  Future<Post> getPost(int id) async {
    final response = await _client.get(Uri.parse('$_baseUrl/$id'));
    _checkStatus(response, {200});
    return Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  Future<List<Post>> getPosts() async {
    final response = await _client.get(Uri.parse('$_baseUrl?_limit=10'));
    _checkStatus(response, {200});
    final data = jsonDecode(response.body) as List<dynamic>;
    return data
        .map((item) => Post.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<Post> createPost(Post post) async {
    final response = await _client.post(
      Uri.parse(_baseUrl),
      headers: _headers,
      body: jsonEncode(post.toJson()),
    );
    _checkStatus(response, {201});
    return Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  Future<Post> updatePost(Post post) async {
    if (post.id == null) throw ArgumentError('O post precisa ter um ID.');

    final response = await _client.put(
      Uri.parse('$_baseUrl/${post.id}'),
      headers: _headers,
      body: jsonEncode(post.toJson()),
    );
    _checkStatus(response, {200});
    return Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  }

  Future<void> deletePost(int id) async {
    final response = await _client.delete(Uri.parse('$_baseUrl/$id'));
    _checkStatus(response, {200});
  }

  void close() => _client.close();

  static const _headers = {'Content-Type': 'application/json; charset=UTF-8'};

  void _checkStatus(http.Response response, Set<int> expected) {
    if (!expected.contains(response.statusCode)) {
      throw Exception('Erro HTTP ${response.statusCode}: ${response.body}');
    }
  }
}
