class Post {
  final int id;
  final String title;
  final String description;

  Post({required this.id, required this.title, required this.description});

  // Factory method to create a Post from a DTO
  factory Post.fromDTO(dynamic dto) {
    return Post(
      id: dto.id,
      title: dto.title,
      description:
          dto.body, // Map 'body' from API to 'description' in our model
    );
  }
}
