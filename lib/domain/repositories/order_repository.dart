import 'package:dio/dio.dart';
import 'package:test_app/data/api/rest_client.dart';
import 'package:test_app/domain/entities/order.dart';

final class OrderRepository {
  final restClient = RestClient(Dio());

  Future<Order> fetchOrder() async {
    final orderModel = await restClient.fetchOrderInfo();
    return Order.fromModel(orderModel);
  }
}