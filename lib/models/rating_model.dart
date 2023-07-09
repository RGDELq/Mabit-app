import 'dart:convert';

class RatingModel {
  int id;
  String name;
  int propertyId;
  String createdAt;
  String updatedAt;

  RatingModel({
    required this.id,
    required this.name,
    required this.propertyId,
    required this.createdAt,
    required this.updatedAt, 
  });

  factory RatingModel.fromRawJson(String str) =>
      RatingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        id: json["id"],
        name: json["name"],
        propertyId: json["property_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "property_id": propertyId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
