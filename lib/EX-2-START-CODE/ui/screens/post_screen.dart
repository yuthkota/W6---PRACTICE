import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/post.dart';
import '../providers/async_value.dart';
import '../providers/post_provider.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  1 - Get the post provider
    final PostProvider postProvider = Provider.of<PostProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          IconButton(
            // 2- Fetch the posts
            onPressed: () => {postProvider.fetchPosts()},
            icon: const Icon(Icons.update),
          ),
        ],
      ),

      // 3 -  Display the posts
      body: Center(child: _buildBody(postProvider)),
    );
  }

  Widget _buildBody(PostProvider postProvider) {
    final postsValue = postProvider.postsValue;

    if (postsValue == null) {
      return Text('Tap refresh to display posts'); // display an empty state
    }

    switch (postsValue.state) {
      case AsyncValueState.loading:
        return CircularProgressIndicator(); // display a progress

      case AsyncValueState.error:
        return Text('Error: ${postsValue.error}'); // display a error

      case AsyncValueState.success:
        final posts = postsValue.data!;
        
        // Check if the list is empty
        if (posts.isEmpty) {
          return Text('No posts for now'); // display empty list message
        }
        
        // Display the list of posts
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return PostCard(post: posts[index]);
          },
        );
    }
  }
}

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(post.title),
        subtitle: Text(post.description),
        leading: CircleAvatar(
          child: Text(post.id.toString()),
        ),
      ),
    );
  }
}

