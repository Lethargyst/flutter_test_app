class HotelModel {
  const HotelModel({
    required this.id,
    required this.name,
    required this.address,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.description,
    required this.peculiarities,
  });
  
  final int id;
  final String name;
  final String address;
  final double minimalPrice;
  final String priceForIt;
  final double rating;
  final String ratingName;
  final List<Uri> imageUrls;
  final String description;
  final List<String> peculiarities;

  factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
    id: json['id'] as int,
    name: json['name'] as String,
    address: json['adress'] as String,
    minimalPrice: (json['minimal_price'] as num).toDouble(),
    priceForIt: json['price_for_it'] as String,
    rating: (json['rating'] as num).toDouble(),
    ratingName: json['rating_name'] as String,
    imageUrls: (json['image_urls'] as List<dynamic>)
        .map((e) => Uri.parse(e as String))
        .toList(),
    description: json['about_the_hotel']['description'] as String,
    peculiarities: (json['about_the_hotel']['peculiarities'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': this.id,
    'name': this.name,
    'address': this.address,
    'minimal_price': this.minimalPrice,
    'price_for_it': this.priceForIt,
    'rating': this.rating,
    'rating_name': this.ratingName,
    'image_urls': this.imageUrls.map((e) => e.toString()).toList(),
    'description': this.description,
    'peculiarities': this.peculiarities,
  };
}

