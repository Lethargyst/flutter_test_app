part of 'hotel_cubit.dart';

enum Status { initial, loading, success, failure }

final class HotelState {
  const HotelState({
    this.status = Status.initial,
    this.hotel
  });

  final Status status;
  final Hotel? hotel;
}
