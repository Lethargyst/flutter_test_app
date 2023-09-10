import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/config/themes/theme.dart';
import 'package:test_app/presentation/blocs/order/order_bloc.dart';
import 'package:test_app/presentation/entities/form_field.dart';
import 'package:test_app/utils/constants/form_field_type.dart';

class PrimaryFormField extends StatefulWidget {
  const PrimaryFormField({ 
    super.key,
    required this.formId,
    required this.type,
    required this.title,
    this.content
  });

  final int formId;
  final FormFieldType type;
  final String title;
  final String? content;

  @override
  _PrimaryFormFieldState createState() => _PrimaryFormFieldState();
}

class _PrimaryFormFieldState extends State<PrimaryFormField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  void _onFocusChange() {
    context.read<OrderBloc>().add(
      PrimaryFieldWroteEvent(
        formId: widget.formId, 
        type: widget.type, 
        content: _controller.text
      )
    );
  }

  void _onInputChange() {
    context.read<OrderBloc>().add(
      PrimaryFieldValidatedEvent(
        formId: widget.formId, 
        type: widget.type, 
        content: _controller.text
      )
    );
  }

  @override
  void initState() {
    _focusNode.addListener(_onFocusChange);
    _controller.addListener(_onInputChange);
    _controller.text = widget.content ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OrderBloc, OrderState, FormFieldEntity>(
      selector: (state) {
        return state.tourists[widget.formId].fields[widget.type] ?? FormFieldEntity(content: '');
      },
      builder: (context, state) {        
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: state.isValid ? AppColors.lightGrey : AppColors.error
          ),
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              border: InputBorder.none,
              labelText: widget.title,
              labelStyle: AppFonts.hint,
            ),
          ),
        );
      },
    );
  }
}