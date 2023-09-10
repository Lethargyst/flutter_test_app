import 'package:dio/dio.dart';
import 'package:test_app/data/api/rest_client.dart';
import 'package:test_app/domain/entities/room.dart';

final class RoomsRepository {
  final restClient = RestClient(Dio());

  Future<List<Room>> fetchRooms() async {
    final rooms = (await restClient.fetchRoomsInfo()).list;
    return List.generate(
      rooms.length, (index) => Room.fromModel(rooms[index])
    );
  }
}