import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:mabitt/screens/widgets/phone_textfiled.dart';
import 'package:mabitt/screens/widgets/primary_btn.dart';
import 'package:mabitt/screens/widgets/textfield.dart';
import 'package:provider/provider.dart';

import '../../models/category_model.dart';
import '../../provider/dark_mode_provider.dart';
import '../../provider/property_provider.dart';
import '../../services/api.dart';
import '../../utils/theme.dart';

class PostForm extends StatefulWidget {
  const PostForm({Key? key}) : super(key: key);

  @override
  State<PostForm> createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  TextEditingController properynameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  List<String> listitem = ["Benghazi", "Tripoli", "Misrata"];
  String? selectedCity = "Benghazi";

  List<String> rooms = ["1", "2", "3", "4"];
  String? selectedrooms = "2";

  List<String> floors = [
    "1",
    "2",
    "3",
    "4",
    "5",
  ];
  String? selectedfloors = "5";

  CategoryModel? selectedcategory;

  File? _selectedImage;

  void _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dakmode = Provider.of<DarkModeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFieldWidget(
                      filled: true,
                      fillColor: dakmode.isDark ? darkcolor : white,
                      label: 'Property name',
                      hintText: 'Enter property name',
                      controller: properynameController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter the name';
                        }
                        return null;
                      },
                    ),
                    TextFieldWidget(
                      filled: true,
                      fillColor: dakmode.isDark ? white : darkcolor,
                      label: 'Description',
                      hintText: 'About the property',
                      controller: descriptionController,
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
                      controller: phoneController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please enter your Phone number";
                        }
                        if (value.length != 10) {
                          return "Please enter a valid phone number";
                        }
                        return null;
                      },
                    ),
                    PhoneTextFieldWidget(
                      keyboardType: TextInputType.number,
                      label: 'Price per night',
                      hintText: "£",
                      controller: priceController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please enter a price";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 160,
                          child: Consumer<PropertyProvider>(
                              builder: (context, propertyProvider, child) {
                            return DropdownButtonFormField<CategoryModel>(
                              decoration: InputDecoration(
                                labelText: 'Category ',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: darkblue,
                                  ),
                                ),
                              ),
                              value: selectedcategory,
                              items: propertyProvider.categories
                                  .map((item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(
                                          item.name.toString(),
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (item) =>
                                  setState(() => selectedcategory = item),
                            );
                          }),
                        ),
                        SizedBox(
                          width: 160,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'City',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: darkblue,
                                ),
                              ),
                            ),
                            value: selectedCity,
                            items: listitem
                                .map((item) => DropdownMenuItem(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (item) =>
                                setState(() => selectedCity = item),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 160,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Rooms',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: darkblue,
                                ),
                              ),
                            ),
                            value: selectedrooms,
                            items: rooms
                                .map((item) => DropdownMenuItem(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (item) =>
                                setState(() => selectedrooms = item),
                          ),
                        ),
                        SizedBox(
                          width: 160,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              labelText: 'Floors',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: darkblue,
                                ),
                              ),
                            ),
                            value: selectedfloors,
                            items: floors
                                .map((item) => DropdownMenuItem(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (item) =>
                                setState(() => selectedfloors = item),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton.icon(
                      onPressed: _pickImage,
                      icon: const Icon(Icons.upload_file),
                      label: Text(
                        'Upload Image',
                        style: TextStyle(color: darkblue),
                      ),
                    ),
                    _selectedImage != null
                        ? Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 200,
                            child: Image.file(
                              _selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const SizedBox(),
                    Primarybtn(
                      text: " Submit ",
                      withBorder: false,
                      isloading: false,
                      onPressed: () {
                        // propertyProvider.addProperty({
                        //   'name': properynameController.text.toString(),
                        //   'detail': descriptionController.text.toString(),
                        //   'category_id': selectedcategory!.id,
                        //   'price': priceController.text,
                        //   'floor': selectedfloors!,
                        //   'rooms': selectedrooms!,
                        //   'phonenumber': phoneController.text,
                        //   //  uploadImage(_selectedImage).then((response))
                        // });
                        // Create a multipart request
                        if (_selectedImage != null) {
                          Api().upload(
                                  _selectedImage!,
                                  // propertyProvider.addProperty(
                                  {
                                'name': properynameController.text.toString(),
                                'detail': descriptionController.text.toString(),
                                'category_id': selectedcategory!.id.toString(),
                                'price': priceController.text,
                                'floor': selectedfloors!.toString(),
                                'rooms': selectedrooms!.toString(),
                                'city': selectedCity.toString(),
                                'status': 0,
                                'phonenumber': phoneController.text,
                                //  uploadImage(_selectedImage).then((response))
                              }) //)
                              .then((response) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('success'),
                                    content: const Text(
                                        'your information have been submitted successfully.'),
                                    actions: [
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                });
                            print(response.statusCode.toString() +
                                " " +
                                response.body);
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
