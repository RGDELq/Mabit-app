class PropertyModel {
  String title;
  String subTitle;
  String details;
  String thumbnail;
  List<String> images;
  int rooms;
  int area;
  int floors;
  int price;
  double rating;
  PropertyModel({
    required this.title,
    required this.subTitle,
    required this.details,
    required this.thumbnail,
    required this.images,
    required this.rooms,
    required this.area,
    required this.floors,
    required this.price,
    required this.rating,
  });
}

List<PropertyModel> properties = [
  PropertyModel(
    title: 'Villa at hay salam',
    subTitle: "St. Second road  3rd ",
    details:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    thumbnail: 'images/properties/villa2.jpeg',
    images: [
      'images/properties/villa1.jpeg',
    ],
    rooms: 5,
    area: 3000,
    floors: 3,
    price: 3000,
    rating: 4.3,
  ),
  PropertyModel(
    title: 'Duplex Housing',
    subTitle: "St. Second Avenue 780, NY",
    details:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    thumbnail: 'images/properties/ap4.jpeg',
    images: [
      'images/properties/ap2.jpeg',
    ],
    rooms: 3,
    area: 3500,
    floors: 2,
    price: 5000,
    rating: 4.7,
  ),
  PropertyModel(
    title: ' Apartment',
    subTitle: "Vinessia at forno resturante",
    details:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    thumbnail: 'images/properties/ap6.jpeg',
    images: [
      'images/properties/ap4.jpeg',
    ],
    rooms: 4,
    area: 4200,
    floors: 3,
    price: 6000,
    rating: 4.8,
  ),
];
