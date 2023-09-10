import 'package:flutter/material.dart';
import 'package:test_app/config/themes/theme.dart';
import 'package:test_app/domain/entities/order.dart';
import 'package:test_app/presentation/widgets/general/general.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({  
    required this.order
  });

  final Order order;

  @override
  Widget build(BuildContext context){
    return PrimaryContainer(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          _TableRow(first: 'Вылет из', second: order.departure),
          const SizedBox(height: 16),
          _TableRow(first: 'Страна, город', second: order.arrivalCountry),
          const SizedBox(height: 16),
          _TableRow(first: 'Даты', second: '${order.tourDateStart} – ${order.tourDateStop}'),
          const SizedBox(height: 16),
          _TableRow(first: 'Кол-во ночей', second: order.numberOfNights.toString()),
          const SizedBox(height: 16),
          _TableRow(first: 'Отель', second: order.hotelName),
          const SizedBox(height: 16),
          _TableRow(first: 'Номер', second: order.room),
          const SizedBox(height: 16),
          _TableRow(first: 'Питание', second: order.nutrition),
        ],
      )
    );
  }
}

class _TableRow extends StatelessWidget {
  const _TableRow({ 
    required this.first,
    required this.second
  });

  final String first;
  final String second;

  @override
  Widget build(BuildContext context){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(first, style: AppFonts.body.copyWith(color: AppColors.grey))
        ),

        Expanded(
          flex: 3,
          child: Text(second, style: AppFonts.body)
        )
      ],
    );
  }
}