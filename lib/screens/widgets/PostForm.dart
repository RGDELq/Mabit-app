import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mabitt/screens/image.dart';
import 'package:mabitt/screens/widgets/phone_textfiled.dart';
import 'package:mabitt/screens/widgets/text_field_widget.dart';

import '../tabs.dart';
import 'main_button.dart';

class PostForm extends StatefulWidget {
  const PostForm({super.key});

  @override
  State<PostForm> createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  TextEditingController properynameController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  TextEditingController DPhoneController = TextEditingController();
  TextEditingController PriceController = TextEditingController();

  // File? _image;

  // // This is the image picker
  // final _picker = ImagePicker();
  // // Implementing the image picker
  // Future<void> _openImagePicker() async {
  //   final XFile? pickedImage =
  //       await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     setState(() {
  //       _image = File(pickedImage.path);
  //     });
  //   }
  // }

  List<String> listitem = ["Benghazi", "Tripoli", "Misrata"];
  String? selectedItem = "Benghazi";

  List<String> catgory = ["Villa", "real estant", "Apartment"];
  String? selectedcatgory = "Villa";

  List<String> rooms = [
    "one",
    "two",
    "three",
    "four",
  ];
  String? selectedrooms = "two";

  List<String> floors = [
    "5",
    "7",
    "8",
    "9",
  ];
  String? selectedfloors = "5";
  TextEditingController PhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFieldWidget(
                    label: 'property name',
                    hintText: 'Enter property name ',
                    controller: properynameController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter the name';
                      }
                      return null;
                    },
                  ),
                  TextFieldWidget(
                    label: 'Description',
                    hintText: 'About the property',
                    controller: DescriptionController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter description info';
                      }
                      return null;
                    },
                  ),
                  PhoneTextFieldWidget(
                    keyboardType: TextInputType.phone,
                    label: 'Phone number',
                    hintText: 'Ex 09X0000000',
                    controller: PhoneController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter your Phone number";
                      }
                      if (value.length != 10) {
                        return "please enter a valid phone number";
                      }
                      return null;
                    },
                  ),
                  PhoneTextFieldWidget(
                    keyboardType: TextInputType.number,
                    label: 'Price per night',
                    hintText: "£",
                    controller: PriceController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter a price";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 160,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Category ',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: Color(0xff114E60))),
                          ),
                          value: selectedcatgory,
                          items: catgory
                              .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(item,
                                      style: const TextStyle(fontSize: 12))))
                              .toList(),
                          onChanged: (item) =>
                              setState(() => selectedcatgory = item),
                        ),
                      ),
                      Container(
                        width: 160,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'City',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: Color(0xff114E60))),
                          ),
                          value: selectedItem,
                          items: listitem
                              .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(item,
                                      style: const TextStyle(fontSize: 12))))
                              .toList(),
                          onChanged: (item) =>
                              setState(() => selectedItem = item),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 160,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Number of rooms ',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: Color(0xff114E60))),
                          ),
                          value: selectedrooms,
                          items: rooms
                              .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(item,
                                      style: const TextStyle(fontSize: 12))))
                              .toList(),
                          onChanged: (item) =>
                              setState(() => selectedrooms = item),
                        ),
                      ),
                      Container(
                        width: 160,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Number of floors',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: Color(0xff114E60))),
                          ),
                          value: selectedItem,
                          items: listitem
                              .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(item,
                                      style: const TextStyle(fontSize: 12))))
                              .toList(),
                          onChanged: (item) =>
                              setState(() => selectedItem = item),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 44, 73, 121),
                        elevation: 9,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Imagee()));
                      },
                      child: const Text(' Add Images'),
                    ),
                    // const SizedBox(height: 50),
                    // // The picked image will be displayed here
                    // Container(
                    //   width: 130,
                    //   height: 100,
                    //   color: Colors.white,
                    //   child: _image != null
                    //       ? Image.file(_image! as File, fit: BoxFit.cover)
                    //       : const Text('please select a file to display'),
                    // )
                  ]),
                  // SizedBox(
                  //   height: size.height * 0.05,
                  // ),
                  MainButton(
                      text: " Submit ",
                      withBorder: false,
                      isloading: false,
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: ((context) => const TabsScreen())));
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
