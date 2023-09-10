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
    context.read<OrderBloc>().add(PhoneFieldWroteEvent(content: _controller.text));
  }

  @override
  void initState() {
    _focusNode.addListener(_onFocusChange);
    _controller.addListener(_onInputChange);
    _controller.text = context.read<OrderBloc>().state.phone;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: state.isValidPhone ?? true ? AppColors.lightGrey : AppColors.error
          ),
          child: TextFormField(
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
