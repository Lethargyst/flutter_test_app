part of 'order_bloc.dart';

enum Status { initial, loading, success, failure }

final class OrderState {
  const OrderState({
    this.status = Status.initial,
    this.tourists = const [],
    this.order,
    this.isValidEmail,
    this.isValidPhone,
    this.isValid = false
  });

  final Status status;
  final Order? order;

  final bool? isValidEmail;
  final bool? isValidPhone;
  final List<TouristEntity> tourists;
  final bool isValid;

  OrderState copyWith({
    Status? status,
    Order? order,
    bool? isValidEmail,
    bool? isValidPhone,
    List<TouristEntity>? tourists,
    bool? isValid
  }) {
    return OrderState(
      status: status ?? this.status,
      order: order ?? this.order,
      isValidEmail: isValidEmail ?? this.isValidEmail,
      isValidPhone: isValidPhone ?? this.isValidPhone,
      tourists: tourists ?? this.tourists,
      isValid: isValid ?? this.isValid
    );
  }
}