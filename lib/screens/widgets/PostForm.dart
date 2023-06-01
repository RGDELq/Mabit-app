import 'dart:core';

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
  List<String> listitem = ["Benghazi", "Tripoli", "Misrata"];
  String? selectedItem = "Benghazi";

  List<String> catgory = ["Villa", "real estant", "Apartment"];
  String? selectedcatgory = "Villa";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Property name',
              prefixIcon: Icon(Icons.insert_drive_file_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Description',
              prefixIcon: Icon(Icons.text_decrease),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 40),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            child: DropdownButtonFormField<String>(
              padding: EdgeInsets.only(right: 200),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 3, color: Color(0xff114E60))),
              ),
              value: selectedItem,
              items: listitem
                  .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item, style: TextStyle(fontSize: 20))))
                  .toList(),
              onChanged: (item) => setState(() => selectedItem = item),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            child: DropdownButtonFormField<String>(
              padding: EdgeInsets.only(right: 200),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 3, color: Color(0xff114E60))),
              ),
              value: selectedcatgory,
              items: catgory
                  .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item, style: TextStyle(fontSize: 20))))
                  .toList(),
              onChanged: (item) => setState(() => selectedcatgory = item),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          CustomizedButton(
            buttonText: "Submit",
            buttonColor: ColorManager.primary,
            textColor: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
