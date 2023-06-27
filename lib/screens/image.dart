import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mabitt/screens/widgets/post_form.dart';
import 'package:mabitt/screens/widgets/primary_btn.dart';

class Imagee extends StatefulWidget {
  const Imagee({super.key});

  @override
  State<Imagee> createState() => _ImageeState();
}

class _ImageeState extends State<Imagee> {
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _imageList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          ElevatedButton(
              onPressed: () {
                imageSelection();
              },
              child: const Text('select image')),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: _imageList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Stack(fit: StackFit.expand, children: [
                      Image.file(
                        File(_imageList[index].path),
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        right: 4,
                        top: 4,
                        child: Container(
                          color: Colors.transparent,
                          child: IconButton(
                            onPressed: () {
                              _imageList.removeAt(index);
                              setState(() {});
                            },
                            icon: const Icon(Icons.delete_forever_outlined),
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ]),
                  );
                }),
          ),
          Primarybtn(
              text: " Submit ",
              withBorder: false,
              isloading: false,
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: ((context) => const PostForm())));
              }),
        ]),
      ),
    );
  }

  void imageSelection() async {
    {
      final XFile? selectImage =
          await _picker.pickImage(source: ImageSource.gallery);
      if (selectImage!.path.isNotEmpty) {
        _imageList.add(selectImage);
      }
    }
    setState(() {});
  }
}
