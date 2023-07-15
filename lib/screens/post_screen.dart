import 'package:flutter/material.dart';
import 'package:mabitt/screens/widgets/post_form.dart';
import 'package:mabitt/utils/theme.dart';
import 'package:provider/provider.dart';

import '../provider/dark_mode_provider.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    final dakmode = Provider.of<DarkModeProvider>(context);

    return Scaffold(
      backgroundColor: secprimary,
      appBar: AppBar(
        title: const Text("Add Property post"),
        backgroundColor: dakmode.isDark ? primary : secprimary,
        centerTitle: true,
      ),
      body: const PostForm(),
    );
  }
}
