import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({super.key});

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Center(
      // height: 115,
      // width: 115,
      child: Stack(
        children: <Widget>[
          CircleAvatar(
              radius: 80,
              backgroundColor: Colors.pink,
              backgroundImage: _imageFile == null
                  ? null
                  : FileImage(File(_imageFile!.path))),
          Positioned(
            right: 20,
            bottom: 20,
            child: SizedBox(
              height: 46,
              width: 46,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context, builder: ((builder) => bottomsheet()));
                },
                child: Icon(
                  Icons.camera_alt,
                  size: 25,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomsheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(children: <Widget>[
        Text(
          'choose pic',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //   Icon(Icons.camera_alt_outlined),
            //  onTap: () {},
            TextButton(
                onPressed: () {
                  takephoto(ImageSource.camera);
                },
                child: Icon(Icons.camera_alt_rounded)),
            TextButton(
                onPressed: () {
                  takephoto(ImageSource.gallery);
                },
                child: Icon(Icons.image)),
          ],
        ),
      ]),
    );
  }

  void takephoto(ImageSource) async {
    final PickedFile = await _picker.pickImage(
      source: ImageSource,
    );
    setState(() {
      _imageFile == PickedFile;
    });
  }
}

// class CreatProfile extends StatefulWidget {
//   CreatProfile({key}) : super(key: key);

//   @override
//   _CreatProfileState createState() => _CreatProfileState();
// }

// class _CreatProfileState extends State<CreatProfile> {
//   bool circular = false;
//   PickedFile? _imageFile;
//   final _globalkey = GlobalKey<FormState>();

//   final ImagePicker _picker = ImagePicker();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: _globalkey,
//         child: ListView(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//           children: <Widget>[
//             InkWell(
//               onTap: () async {
//                 setState(() {
//                   circular = true;
//                 });
//               },
//               child: Center(
//                 child: Container(
//                   width: 200,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Colors.teal,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Center(
//                     child: circular
//                         ? CircularProgressIndicator()
//                         : Text(
//                             "Submit",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget imageProfile() {
//     return Center(
//       child: Stack(children: <Widget>[
//         CircleAvatar(
//           radius: 80.0,
//           backgroundImage:
//               _imageFile == null ? null : FileImage(File(_imageFile!.path)),
//         ),
//         Positioned(
//           bottom: 20.0,
//           right: 20.0,
//           child: InkWell(
//             onTap: () {
//               showModalBottomSheet(
//                 context: context,
//                 builder: ((builder) => bottomSheet()),
//               );
//             },
//             child: Icon(
//               Icons.camera_alt,
//               color: Colors.teal,
//               size: 28.0,
//             ),
//           ),
//         ),
//       ]),
//     );
//   }

//   Widget bottomSheet() {
//     return Container(
//       height: 100.0,
//       width: MediaQuery.of(context).size.width,
//       margin: EdgeInsets.symmetric(
//         horizontal: 20,
//         vertical: 20,
//       ),
//       child: Column(
//         children: <Widget>[
//           Text(
//             "Choose Profile photo",
//             style: TextStyle(
//               fontSize: 20.0,
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
//             TextButton.icon(
//               icon: Icon(Icons.camera),
//               onPressed: () {
//                 takePhoto(ImageSource.camera);
//               },
//               label: Text("Camera"),
//             ),
//             TextButton.icon(
//               icon: Icon(Icons.image),
//               onPressed: () {
//                 takePhoto(ImageSource.gallery);
//               },
//               label: Text("Gallery"),
//             ),
//           ])
//         ],
//       ),
//     );
//   }

//   void takePhoto(ImageSource source) async {
//     final pickedFile = await _picker.getImage(
//       source: source,
//     );
//     setState(() {
//       _imageFile = pickedFile!;
//     });
//   }
// }
