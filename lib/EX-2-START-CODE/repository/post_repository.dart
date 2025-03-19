import '../model/post.dart';

abstract class PostRepository {
  // Changed to return a list of posts
  Future<List<Post>> getPosts();
}

