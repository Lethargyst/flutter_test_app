import 'package:dio/dio.dart';
import 'package:test_app/data/api/rest_client.dart';
import 'package:test_app/domain/entities/hotel.dart';

final class HotelRepository {
  final restClient = RestClient(Dio());

  Future<Hotel> fetchHotel() async {
    final hotelModel = await restClient.fetchHotelInfo();
    return Hotel.fromModel(hotelModel);
  }
}