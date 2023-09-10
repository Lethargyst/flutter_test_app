import 'package:test_app/data/models/hotel/hotel.dart';

final class Hotel extends HotelModel {
  const Hotel({
    required super.id,
    required super.name,
    required super.address,
    required super.minimalPrice,
    required super.priceForIt,
    required super.rating,
    required super.ratingName,
    required super.imageUrls,
    required super.description,
    required super.peculiarities,
  });

  factory Hotel.fromModel(HotelModel model) => Hotel(
    id : model.id,
    name : model.name,
    address : model.address,
    minimalPrice : model.minimalPrice,
    priceForIt : model.priceForIt,
    rating : model.rating,
    ratingName : model.ratingName,
    imageUrls : model.imageUrls,
    description : model.description,
    peculiarities : model.peculiarities
  );
}