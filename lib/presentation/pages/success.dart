import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_app/config/themes/theme.dart';
import 'package:test_app/presentation/widgets/general/general.dart';

@RoutePage()
class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orderNum = Random().nextInt(1000000);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PrimaryAppBar(
          title: 'Заказ оплачен',
          enablePop: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Container()),

                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.lightGrey,
                  ),
                  child: Image(image: AssetImage('assets/pics/Party Popper.png')),
                ),
                  
                const SizedBox(height: 32),
                  
                Text('Ваш заказ принят в работу', style: AppFonts.title),
                  
                const SizedBox(height: 20),
                  
                Text(
                  'Подтверждение заказа №$orderNum может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                  style: AppFonts.body.copyWith(color: AppColors.grey),
                  textAlign: TextAlign.center,
                ),
          
                Expanded(child: Container()),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: PrimaryButton(
                    onTap: () => context.router.popUntilRoot(),
                    title: 'Супер!'
                  )
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
