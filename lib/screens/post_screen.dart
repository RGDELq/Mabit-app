import 'package:flutter/material.dart';
import 'package:mabitt/screens/widgets/post_form.dart';
import 'package:mabitt/utils/theme.dart';

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
        backgroundColor: primary,
        centerTitle: true,
      ),
      body: const PostForm(),
    );
  }
}
