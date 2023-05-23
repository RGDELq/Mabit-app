// ignore_for_file: public_member_api_docs, sort_constructors_first
class RecommendedPlaceModel {
  final String image;
  final double rating;
  final String location;
  RecommendedPlaceModel({
    required this.image,
    required this.rating,
    required this.location,
  });
}

List<RecommendedPlaceModel> recommendedPlaces = [
  RecommendedPlaceModel(
    image: "assets/places/place5.jpg",
    rating: 4.5,
    location: "benghazi. tilmaith ",
  ),
  RecommendedPlaceModel(
    image: "assets/places/place4.jpg",
    rating: 4.7,
    location: "al bayda, st 3rd",
  ),
  RecommendedPlaceModel(
    image: "assets/places/place3.jpg",
    rating: 5,
    location: "Tripoli, saraj",
  ),
  RecommendedPlaceModel(
    image: "assets/places/place2.jpg",
    rating: 4.2,
    location: "benghazi, a; jawhara",
  ),
  RecommendedPlaceModel(
    image: "assets/places/place1.jpg",
    rating: 4.1,
    location: "Misrata, sec road",
  ),
];
