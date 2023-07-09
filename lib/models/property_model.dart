

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
