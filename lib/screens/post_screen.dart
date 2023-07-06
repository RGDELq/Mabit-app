import 'package:flutter/material.dart';
import 'package:mabitt/screens/widgets/post_form.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Property post"),
        backgroundColor: const Color.fromARGB(255, 44, 73, 121),
        centerTitle: true,
      ),
      body: PostForm(),
    );
  }
}
