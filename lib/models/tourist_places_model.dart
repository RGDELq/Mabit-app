// ignore_for_file: public_member_api_docs, sort_constructors_first
class TouristPlacesModel {
  final String name;
  final String image;
  TouristPlacesModel({
    required this.name,
    required this.image,
  });
}

List<TouristPlacesModel> touristPlaces = [
  TouristPlacesModel(name: "Villa", image: "assets/icons/mountain.png"),
  TouristPlacesModel(name: "Chalet", image: "assets/icons/beach.png"),
  TouristPlacesModel(name: "apartments", image: "assets/icons/forest.png"),
  TouristPlacesModel(name: "building", image: "assets/icons/city.png"),
  TouristPlacesModel(name: "real estate", image: "assets/icons/desert.png"),
];
