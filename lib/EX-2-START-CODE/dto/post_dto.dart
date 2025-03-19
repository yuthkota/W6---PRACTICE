class PostDTO {
  final int id;
  final String title;
  final String body;
  final int userId;

  PostDTO({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  factory PostDTO.fromJson(Map<String, dynamic> json) {
    // Validate the JSON structure
    assert(json['id'] is int, 'Post id must be an integer');
    assert(json['title'] is String, 'Post title must be a string');
    assert(json['body'] is String, 'Post body must be a string');
    assert(json['userId'] is int, 'Post userId must be an integer');

    return PostDTO(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
    );
  }
}
