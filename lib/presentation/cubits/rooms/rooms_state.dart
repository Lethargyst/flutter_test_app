part of 'rooms_cubit.dart';

enum Status { initial, loading, success, failure }

final class RoomsState {
  const RoomsState({
    this.status = Status.initial,
    this.rooms
  });

  final Status status;
  final List<Room>? rooms;
}
