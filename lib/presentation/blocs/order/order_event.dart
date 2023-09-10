part of 'order_bloc.dart';

abstract class OrderEvent {}

final class OrderFetchedEvent extends OrderEvent {}

final class TouristAddedEvent extends OrderEvent {}

final class EmailFieldValidatedEvent extends OrderEvent {
  EmailFieldValidatedEvent({ required this.content });

  final String content;
}

final class EmailFieldWroteEvent extends OrderEvent {
  EmailFieldWroteEvent({ required this.content });

  final String content;
}

final class PhoneFieldValidatedEvent extends OrderEvent {
  PhoneFieldValidatedEvent({ required this.content });

  final String content;
}

final class PhoneFieldWroteEvent extends OrderEvent {
  PhoneFieldWroteEvent({ required this.content });

  final String content;
}

final class PrimaryFieldWroteEvent extends OrderEvent {
  PrimaryFieldWroteEvent({ 
    required this.formId,
    required this.type,
    required this.content 
  });

  final int formId;
  final FormFieldType type;
  final String content;
}

final class PrimaryFieldValidatedEvent extends PrimaryFieldWroteEvent {
  PrimaryFieldValidatedEvent({ 
    required super.formId,
    required super.type,
    required super.content 
  });
}

final class FormValidatedEvent extends OrderEvent {}
