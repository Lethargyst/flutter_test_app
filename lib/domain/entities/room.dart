import 'package:test_app/data/models/room/room.dart';

final class Room extends RoomModel {
  const Room({
    required super.id,
    required super.name,
    required super.price,
    required super.pricePer,
    required super.peculiarities,
    required super.imageUrls

  });

  factory Room.fromModel(RoomModel model) => Room(
    id: model.id,
    name: model.name,
    price: model.price,
    pricePer: model.pricePer,
    peculiarities: model.peculiarities,
    imageUrls: model.imageUrls,
  );
}