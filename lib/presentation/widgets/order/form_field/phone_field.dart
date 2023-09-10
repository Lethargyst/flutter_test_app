import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/config/themes/theme.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test_app/presentation/blocs/order/order_bloc.dart';

class PhoneTextField extends StatefulWidget {
  const PhoneTextField({
    super.key,
  });

  @override
  _PhoneTextFieldState createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  final _controller = TextEditingController();
  final _maskFormatter = MaskTextInputFormatter(
    mask: '+7 (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy
  );
  final _focusNode = FocusNode();

  void _onFocusChange() {
    if (!_focusNode.hasFocus && _controller.text != '') 
      context.read<OrderBloc>().add(PhoneFieldValidatedEvent(content: _controller.text));
  }

  void _onInputChange() {
    context.read<OrderBloc>().add(PhoneFieldWroteEvent());
  }

  @override
  void initState() {
    _focusNode.addListener(_onFocusChange);
    _controller.addListener(_onInputChange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<OrderBloc, OrderState, bool>(
      selector: (state) => state.isValidPhone ?? true,
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: state ? AppColors.lightGrey : AppColors.error
          ),
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              border: InputBorder.none,
              labelText: 'Номер телефона',
              labelStyle: AppFonts.hint,
            ),
            inputFormatters: [_maskFormatter],
          ),
        );
      },
    );
  }
}
