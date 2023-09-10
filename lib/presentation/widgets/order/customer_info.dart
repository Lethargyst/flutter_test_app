import 'package:flutter/material.dart';
import 'package:test_app/config/themes/theme.dart';
import 'package:test_app/presentation/widgets/general/general.dart';
import 'package:test_app/presentation/widgets/order/form_field/email_field.dart';
import 'package:test_app/presentation/widgets/order/form_field/phone_field.dart';

class CustomerInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return PrimaryContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Информация о покупателе', style: AppFonts.title),

          const SizedBox(height: 20),

          PhoneTextField(key: ValueKey('phone'),),

          const SizedBox(height: 8),

          EmailTextField(key: ValueKey('email')),

          const SizedBox(height: 8),

          Text(
            'Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту.',
            style: AppFonts.small ,
          )
        ],
      ),
    );
  }
}