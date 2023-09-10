import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/config/themes/theme.dart';
import 'package:test_app/presentation/blocs/order/order_bloc.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({ 
    super.key,
  });

  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  void _onFocusChange() {
    if (!_focusNode.hasFocus && _controller.text != '') 
      context.read<OrderBloc>().add(EmailFieldValidatedEvent(content: _controller.text));
  }

  void _onInputChange() {
    context.read<OrderBloc>().add(EmailFieldWroteEvent());
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
      selector: (state) => state.isValidEmail ?? true,
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
              labelText: 'Почта',
              labelStyle: AppFonts.hint,
            ),
          ),
        );
      },
    );
  }
}