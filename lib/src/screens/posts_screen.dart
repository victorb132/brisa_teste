import 'package:brisa_teste/src/controllers/post_controller.dart';
import 'package:brisa_teste/src/models/post_model.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final PostsController controller = PostsController();
  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = controller.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                futurePosts = controller.fetchPosts(forceUpdate: true);
              });
            },
          )
        ],
      ),
      body: FutureBuilder<List<Post>>(
        future: futurePosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading posts"));
          } else {
            List<Post> posts = snapshot.data ?? [];
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(posts[index].title),
                    subtitle: Text(posts[index].body),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
