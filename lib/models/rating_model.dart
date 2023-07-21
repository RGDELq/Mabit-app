import 'dart:convert';

class RatingModel {
  String name;
  int propertyId;
  String username;
  int status;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  RatingModel({
    required this.name,
    required this.propertyId,
    required this.username,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory RatingModel.fromRawJson(String str) =>
      RatingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        name: json["name"],
        propertyId: json["property_id"],
        username: json["username"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "property_id": propertyId,
        "username": username,
        "status": status,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
