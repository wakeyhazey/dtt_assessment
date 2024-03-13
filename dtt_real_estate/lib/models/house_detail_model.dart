class HouseDetailModel {
  late int id;
  late String image;
  late int price;
  late int bedrooms;
  late int bathrooms;
  late int size;
  late String description;
  late String zipCode;
  late String city;
  late double latitude;
  late double longitude;
  late DateTime createdDate;
  double? distance;

  void toModel(dynamic jsonData) {
    id = jsonData['id'];
    price = jsonData['price'];
    image = jsonData['image'];
    bedrooms = jsonData['bedrooms'];
    bathrooms = jsonData['bathrooms'];
    size = jsonData['size'];
    description = jsonData['description'];
    zipCode = jsonData['zip'];
    city = jsonData['city'];
    latitude = jsonData['latitude'].toDouble();
    longitude = jsonData['longitude'].toDouble();
    createdDate = DateTime.parse(jsonData['createdDate']);
  }
}
