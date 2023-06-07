import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/theme.dart';
import 'customized_button.dart';

class PostForm extends StatefulWidget {
  const PostForm({super.key});

  @override
  State<PostForm> createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  File? _image;

  // This is the image picker
  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  List<String> listitem = ["Benghazi", "Tripoli", "Misrata"];
  String? selectedItem = "Benghazi";

  List<String> catgory = ["Villa", "real estant", "Apartment"];
  String? selectedcatgory = "Villa";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: 340,
                child: SizedBox(
                  width: 240, // <-- TextField width

                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Property name',
                      prefixIcon: const Icon(Icons.insert_drive_file_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: 340,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                    prefixIcon: const Icon(Icons.text_decrease),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 30),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: 340,
                child: SizedBox(
                  width: 200,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Price per night',
                      prefixIcon: const Icon(Icons.attach_money_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 200,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xff114E60))),
                  ),
                  value: selectedcatgory,
                  items: catgory
                      .map((item) => DropdownMenuItem(
                          value: item,
                          child:
                              Text(item, style: const TextStyle(fontSize: 12))))
                      .toList(),
                  onChanged: (item) => setState(() => selectedcatgory = item),
                ),
              ),
              Container(
                width: 160,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 1, color: Color(0xff114E60))),
                  ),
                  value: selectedItem,
                  items: listitem
                      .map((item) => DropdownMenuItem(
                          value: item,
                          child:
                              Text(item, style: const TextStyle(fontSize: 12))))
                      .toList(),
                  onChanged: (item) => setState(() => selectedItem = item),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(children: [
            ElevatedButton(
              onPressed: _openImagePicker,
              child: const Text('Select An Image'),
            ),
            const SizedBox(height: 50),
            // The picked image will be displayed here
            Container(
              width: 130,
              height: 100,
              color: Colors.white,
              child: _image != null
                  ? Image.file(_image! as File, fit: BoxFit.cover)
                  : const Text('please select a file to display'),
            )
          ]),
        ],
      ),
    );
  }
}
