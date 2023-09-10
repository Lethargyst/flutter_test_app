import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_app/domain/entities/order.dart';
import 'package:test_app/domain/repositories/order_repository.dart';
import 'package:test_app/presentation/entities/form_field.dart';
import 'package:test_app/presentation/entities/tourist.dart';
import 'package:test_app/utils/constants/form_field_type.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderState()) {
    on<OrderFetchedEvent>(_onOrderFetched);
    on<EmailFieldValidatedEvent>(_onEmailValidated);
    on<EmailFieldWroteEvent>(_onEmailFieldWrote);
    on<PhoneFieldValidatedEvent>(_onPhoneValidated);
    on<PhoneFieldWroteEvent>(_onPhoneFieldWrote);
    on<PrimaryFieldValidatedEvent>(_onPrimaryFieldValidated);
    on<PrimaryFieldWroteEvent>(_onPrimaryFieldWrote);
    on<TouristAddedEvent>(_onTouristAdded);
    on<FormValidatedEvent>(_onFormValidated);
  }

  final repository = OrderRepository();

  void _onOrderFetched(OrderFetchedEvent event, Emitter<OrderState> emit) async {
    emit(OrderState(status: Status.loading));
    debugPrint('Fetching order...');

    final order = await repository.fetchOrder();
    
    debugPrint('Order successfully fetched!');
    emit(OrderState(
      status: Status.success,
      order: order
    ));
  }

  void _onTouristAdded(TouristAddedEvent event, Emitter<OrderState> emit) async {
    emit(state.copyWith(
      status: Status.success,
      tourists: [
        ...state.tourists, 
        TouristEntity.empty(),
      ],
      isValid: false
    ));
  }

  void _onEmailValidated(EmailFieldValidatedEvent event, Emitter<OrderState> emit) async {
    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );

    emit(state.copyWith(
      isValidEmail: emailRegex.hasMatch(event.content)
    ));
  }

  void _onEmailFieldWrote(EmailFieldWroteEvent event, Emitter<OrderState> emit) async {
    emit(state.copyWith(
      email: event.content,
      isValidEmail: true
    ));
  }

  void _onPhoneValidated(PhoneFieldValidatedEvent event, Emitter<OrderState> emit) async {
    final RegExp phoneRegex = RegExp(
      r'^\+7 \(\d{3}\) \d{3}-\d{2}-\d{2}$',
    );

    emit(state.copyWith(
      isValidPhone: phoneRegex.hasMatch(event.content)
    ));
  }
  
  void _onPhoneFieldWrote(PhoneFieldWroteEvent event, Emitter<OrderState> emit) async {
    emit(state.copyWith(
      phone: event.content,
      isValidPhone: true
    ));
  }

  void _onPrimaryFieldWrote(PrimaryFieldWroteEvent event, Emitter<OrderState> emit) async {
    state.tourists[event.formId].fields[event.type] = FormFieldEntity(
      content: event.content,
      isValid: true
    );
  }

  void _onPrimaryFieldValidated(PrimaryFieldValidatedEvent event, Emitter<OrderState> emit) async {
    state.tourists[event.formId].fields[event.type]?.validate();
    emit(state.copyWith(
      tourists: [...state.tourists]
    ));
  }

  void _onFormValidated(FormValidatedEvent event, Emitter<OrderState> emit) async {
    state.tourists.forEach(
      (tourist) => tourist.validate()
    );

    final isTouristsNotValid = state.tourists.any((tourist) => !tourist.isValid);
    final isFormValid = !isTouristsNotValid 
      && (state.isValidEmail ?? false)
      && (state.isValidPhone ?? false); 

    emit(state.copyWith(
      tourists: [...state.tourists],
      status: isFormValid ? Status.success : Status.failure,
      isValidEmail: state.isValidEmail ?? false,
      isValidPhone: state.isValidPhone ?? false,
      isValid: isFormValid
    ));
  }
}
