import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mabitt/screens/widgets/PostForm.dart';
import 'package:mabitt/screens/widgets/main_button.dart';

class Imagee extends StatefulWidget {
  const Imagee({super.key});

  @override
  State<Imagee> createState() => _ImageeState();
}

class _ImageeState extends State<Imagee> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _ImageList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          ElevatedButton(
              onPressed: () {
                ImageSelection();
              },
              child: const Text('select image')),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: _ImageList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Stack(fit: StackFit.expand, children: [
                      Image.file(
                        File(_ImageList[index].path),
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        right: 4,
                        top: 4,
                        child: Container(
                          color: Colors.transparent,
                          child: IconButton(
                            onPressed: () {
                              _ImageList.removeAt(index);
                              setState(() {});
                            },
                            icon: Icon(Icons.delete_forever_outlined),
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ]),
                  );
                }),
          ),
          MainButton(
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

  void ImageSelection() async {
    {
      final XFile? selectImage =
          await _picker.pickImage(source: ImageSource.gallery);
      if (selectImage!.path.isNotEmpty) {
        _ImageList.add(selectImage);
      }
    }
    setState(() {});
  }
}
