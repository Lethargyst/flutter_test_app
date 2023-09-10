import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_app/data/models/models.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/35e0d18e-2521-4f1b-a575-f0fe366f66e3')
  Future<HotelModel> fetchHotelInfo();

  @GET('/f9a38183-6f95-43aa-853a-9c83cbb05ecd')
  Future<RoomsListModel> fetchRoomsInfo();

  @GET('/e8868481-743f-4eb2-a0d7-2bc4012275c8')
  Future<OrderModel> fetchOrderInfo();
}
