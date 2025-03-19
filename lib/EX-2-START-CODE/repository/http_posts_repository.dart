import 'dart:convert';
import 'package:http/http.dart' as http;

import '../dto/post_dto.dart';
import '../model/post.dart';
import 'post_repository.dart';

class HttpPostsRepository implements PostRepository {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<List<Post>> getPosts() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> jsonList = json.decode(response.body);

        // Convert each JSON object to a PostDTO, then to a Post
        return jsonList.map((json) {
          try {
            final PostDTO dto = PostDTO.fromJson(json);
            return Post.fromDTO(dto);
          } catch (e) {
            print('Error parsing post: $e');
            // Skip invalid posts
            rethrow;
          }
        }).toList();
      } else {
        throw Exception('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors or other exceptions
      throw Exception('Failed to fetch posts: $e');
    }
  }
}
