
final class FormFieldEntity {
  FormFieldEntity({
    required this.content,
    this.isValid = true
  });

  final String content;
  bool isValid;

  FormFieldEntity copyWith({
    String? content,
    bool? isValid
  }) => FormFieldEntity(
    content: content ?? this.content,
    isValid:  isValid ?? this.isValid
  );

  void validate() {
    isValid = content.isNotEmpty;
  }
}