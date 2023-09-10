import 'package:flutter/material.dart';
import 'package:test_app/config/themes/theme.dart';
import 'package:test_app/domain/entities/order.dart';
import 'package:test_app/presentation/widgets/general/general.dart';
import 'package:test_app/utils/extensions/int_separator.dart';

class Summary extends StatelessWidget {
  const Summary({ 
    super.key,
    required this.order 
  });

  final Order order;

  @override
  Widget build(BuildContext context){
    final summary = order.tourPrice + order.fuelCharge + order.serviceCharge;

    return PrimaryContainer(
      child: Column(
        children: [
          _SummaryRow(
            first: Text(
              'Тур', 
              style: AppFonts.body.copyWith(color: AppColors.grey)
            ), 
            second: Text(
              '${order.tourPrice.toInt().separated()} ₽',
              style: AppFonts.body,
            )
          ),

          const SizedBox(height: 16),

          _SummaryRow(
            first: Text(
              'Топливный сбор', 
              style: AppFonts.body.copyWith(color: AppColors.grey)
            ), 
            second: Text(
              '${order.fuelCharge.toInt().separated()} ₽',
              style: AppFonts.body,
            )
          ),

          const SizedBox(height: 16),

          _SummaryRow(
            first: Text(
              'Сервисный сбор', 
              style: AppFonts.body.copyWith(color: AppColors.grey)
            ), 
            second: Text(
              '${order.serviceCharge.toInt().separated()} ₽',
              style: AppFonts.body,
            )

          ),

          const SizedBox(height: 16),

          _SummaryRow(
            first: Text(
              'К оплате', 
              style: AppFonts.body.copyWith(color: AppColors.grey)
            ), 
            second: Text(
              '${summary.toInt().separated()} ₽',
              style: AppFonts.body.copyWith(color: AppColors.blue),
            )
          ),
        ]
      )
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({ 
    required this.first,
    required this.second
  });

  final Widget first;
  final Widget second;

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: first,
        ),

        Align(
          alignment: Alignment.centerRight,
          child: second,
        )
      ],
    );
  }
}