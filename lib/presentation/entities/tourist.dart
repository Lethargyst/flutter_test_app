import 'package:test_app/presentation/entities/form_field.dart';
import 'package:test_app/utils/constants/form_field_type.dart';

final class TouristEntity {
  TouristEntity({
    required this.fields,
    this.isValid = true
  });

  factory TouristEntity.empty() => TouristEntity(
    fields: Map.fromIterable(
      FormFieldType.values,
      key: (type) => type,
      value: (type) => FormFieldEntity(content: '') 
    )
  );

  final Map<FormFieldType, FormFieldEntity?> fields;
  bool isValid;

  void validate() {
    fields.values.forEach((field) => field!.validate());
    isValid = !fields.values.any((field) => !field!.isValid);
  }
}