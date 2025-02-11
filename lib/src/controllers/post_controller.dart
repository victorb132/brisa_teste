import 'dart:convert';
import 'package:brisa_teste/src/models/post_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class PostsController {
  final String apiUrl = "https://jsonplaceholder.typicode.com/posts";
  final Box postsBox = Hive.box('postsBox');

  Future<List<Post>> fetchPosts({bool forceUpdate = false}) async {
    if (!forceUpdate && postsBox.isNotEmpty) {
      return getCachedPosts();
    }
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> postsJson = json.decode(response.body);
      List<Post> posts = postsJson.map((json) => Post.fromJson(json)).toList();
      postsBox.put('posts', postsJson);
      return posts;
    } else {
      throw Exception("Failed to load posts");
    }
  }

  List<Post> getCachedPosts() {
    List<dynamic> postsJson = postsBox.get('posts', defaultValue: []);
    return postsJson
        .map((json) => Post.fromJson(Map<String, dynamic>.from(json)))
        .toList();
  }
}
