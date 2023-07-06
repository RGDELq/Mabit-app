import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import "package:http/http.dart" as http;

import 'package:image_picker/image_picker.dart';
import 'package:mabitt/screens/widgets/phone_textfiled.dart';
import 'package:mabitt/screens/widgets/primary_btn.dart';
import 'package:mabitt/screens/widgets/textfield.dart';
import 'package:provider/provider.dart';

import '../../models/category_model.dart';
import '../../provider/property_provider.dart';
import '../../services/api.dart';

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
    final propertyProvider =
        Provider.of<PropertyProvider>(context, listen: false);

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
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Color(0xff114E60),
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
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Color(0xff114E60),
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
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Color(0xff114E60),
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
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Color(0xff114E60),
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
                      label: const Text(
                        'Upload Image',
                        style: TextStyle(color: Colors.blue),
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
                                'status': 1,
                                'phonenumber': phoneController.text,
                                //  uploadImage(_selectedImage).then((response))
                              }) //)
                              .then((response) {
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
