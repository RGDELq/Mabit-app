// class PropertyModel {
//   String title;
//   String subTitle;
//   String details;
//   String thumbnail;
//   List<String> images;
//   int rooms;
//   int area;
//   int floors;
//   int price;
//   bool isFavorite;
//   double rating;
//   PropertyModel({
//     required this.title,
//     required this.subTitle,
//     required this.details,
//     required this.thumbnail,
//     required this.images,
//     required this.rooms,
//     this.isFavorite = false,
//     required this.area,
//     required this.floors,
//     required this.price,
//     required this.rating,
//   });
// }

// List<PropertyModel> properties = [
//   PropertyModel(
//     title: 'Villa at hay salam',
//     subTitle: "St. Second road  3rd ",
//     details:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
//     thumbnail: 'images/properties/villa1.jpeg',
//     images: [
//       'images/properties/villa1.jpeg',
//     ],
//     rooms: 50,
//     area: 3000,
//     floors: 3,
//     price: 3000,
//     rating: 4.3,
//   ),
//   PropertyModel(
//     title: 'Duplex Housing',
//     subTitle: "St. Second Avenue 780, NY",
//     details:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
//     thumbnail: 'images/properties/ap2.jpeg',
//     images: [
//       'images/properties/ap2.jpeg',
//     ],
//     rooms: 3,
//     area: 3500,
//     floors: 2,
//     price: 5000,
//     rating: 4.7,
//   ),
//   PropertyModel(
//     title: ' Apartment',
//     subTitle: "Vinessia at forno resturante",
//     details:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
//     thumbnail: 'images/properties/ap6.jpeg',
//     images: [
//       'images/properties/ap6.jpeg',
//     ],
//     rooms: 4,
//     area: 4200,
//     floors: 3,
//     price: 6000,
//     rating: 4.8,
//   ),
// ];

// // To parse this JSON data, do
//
//     final propertyModel = propertyModelFromJson(jsonString);

import 'dart:convert';

class PropertyModel {
  int id;
  String name;
  String imageUrl;
  String image;
  String detail;
  int price;
  int floor;
  int rooms;
  String city;
  int phonenumber;
  String createdAt;
  String updatedAt;
  int categoryId;

  PropertyModel({
    required this.id,
    required this.name,
    required this.image,
    required this.imageUrl,
    required this.detail,
    required this.price,
    required this.floor,
    required this.rooms,
    required this.city,
    required this.phonenumber,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryId,
  });

  factory PropertyModel.fromRawJson(String str) =>
      PropertyModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        imageUrl: json["image"],
        detail: json["detail"],
        price: json["price"],
        floor: json["floor"],
        rooms: json["rooms"],
        city: json["city"],
        phonenumber: json["phonenumber"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "detail": detail,
        "price": price,
        "floor": floor,
        "rooms": rooms,
        "city": city,
        "phonenumber": phonenumber,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "category_id": categoryId,
      };

  static map(Function(dynamic property) param0) {}
}
