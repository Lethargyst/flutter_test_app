import 'package:test_app/data/models/order/order.dart';

final class Order extends OrderModel {
  const Order({
    required super.id,
    required super.hotelName,
    required super.hotelAddress,
    required super.horating,
    required super.ratingName,
    required super.departure,
    required super.arrivalCountry,
    required super.tourDateStart,
    required super.tourDateStop,
    required super.numberOfNights,
    required super.room,
    required super.nutrition,
    required super.tourPrice,
    required super.fuelCharge,
    required super.serviceCharge
  });

  factory Order.fromModel(OrderModel model) => Order(
    id : model.id,
    hotelName : model.hotelName,
    hotelAddress : model.hotelAddress,
    horating : model.horating,
    ratingName : model.ratingName,
    departure : model.departure,
    arrivalCountry : model.arrivalCountry,
    tourDateStart : model.tourDateStart,
    tourDateStop : model.tourDateStop,
    numberOfNights : model.numberOfNights,
    room : model.room,
    nutrition : model.nutrition,
    tourPrice : model.tourPrice,
    fuelCharge : model.fuelCharge,
    serviceCharge : model.serviceCharge,
  );
}