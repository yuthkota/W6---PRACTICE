import '../model/post.dart';
import 'post_repository.dart';

class MockPostRepository extends PostRepository {
  @override
  Future<List<Post>> getPosts() {
    // Return a fake list after 5 seconds
    return Future.delayed(Duration(seconds: 5), () {
      return [
        Post(
          id: 1,
          title: 'Introduction to Flutter',
          description: 'Learn the basics of Flutter development',
        ),
        Post(
          id: 2,
          title: 'State Management',
          description: 'Different approaches to manage state in Flutter',
        ),
        Post(
          id: 3,
          title: 'Who is the best',
          description: 'teacher ronan',
        ),
        Post(
          id: 4,
          title: 'Flutter Architecture',
          description: 'Best practices for structuring your Flutter app',
        ),
      ];
    });
  }
}

