part of 'order_bloc.dart';

enum Status { initial, loading, success, failure }

final class OrderState {
  const OrderState({
    this.status = Status.initial,
    this.tourists = const [],
    this.order,
    this.email = '',
    this.isValidEmail,
    this.phone = '',
    this.isValidPhone,
    this.isValid = false
  });

  final Status status;
  final Order? order;

  final String email;
  final bool? isValidEmail;
  final String phone;
  final bool? isValidPhone;
  final List<TouristEntity> tourists;
  final bool isValid;

  OrderState copyWith({
    Status? status,
    Order? order,
    String? email,
    bool? isValidEmail,
    String? phone,
    bool? isValidPhone,
    List<TouristEntity>? tourists,
    bool? isValid
  }) {
    return OrderState(
      status: status ?? this.status,
      order: order ?? this.order,
      email: email ?? this.email,
      isValidEmail: isValidEmail ?? this.isValidEmail,
      phone: phone ?? this.phone,
      isValidPhone: isValidPhone ?? this.isValidPhone,
      tourists: tourists ?? this.tourists,
      isValid: isValid ?? this.isValid
    );
  }
}