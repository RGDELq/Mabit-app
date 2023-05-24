// ignore_for_file: public_member_api_docs, sort_constructors_first
class NearbyPlaceModel {
  final String image;
  final String title;

  NearbyPlaceModel({
    required this.image,
    required this.title,
  });
}

List<NearbyPlaceModel> nearbyPlaces = [
  NearbyPlaceModel(image: "assets/places/place7.jpg", title: 'tolmitah'),
  NearbyPlaceModel(image: "assets/places/place6.jpg", title: 'al bayda'),
  NearbyPlaceModel(image: "assets/places/place5.jpg", title: 'misrata'),
  NearbyPlaceModel(image: "assets/places/place4.jpg", title: 'tolmitah'),
  NearbyPlaceModel(image: "assets/places/place3.jpg", title: 'tolmitah'),
  NearbyPlaceModel(image: "assets/places/place2.jpg", title: 'tolmitah'),
  NearbyPlaceModel(image: "assets/places/place1.jpg", title: 'tolmitah'),
];
