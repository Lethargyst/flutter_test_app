import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/presentation/blocs/order/order_bloc.dart';
import 'package:test_app/presentation/entities/tourist.dart';
import 'package:test_app/presentation/widgets/order/tourists_form/add_tourist.dart';
import 'package:test_app/presentation/widgets/order/tourists_form/tourist_form.dart';

class TouristsForm extends StatelessWidget {
  const TouristsForm({ super.key });

  @override
  Widget build(BuildContext context){
    return BlocSelector<OrderBloc, OrderState, List<TouristEntity>>(
      selector: (state) => state.tourists,
      builder: (context, state) {
        return Column(
          children: [
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.length,
              itemBuilder: (_, index) => TouristForm(index: index), 
              separatorBuilder: (_, __) => const SizedBox(height: 8), 
            ),

            state.length != 0 ? SizedBox(height: 8) : const SizedBox.shrink(),

            AddTourist(),
          ],
        );
      }
    );
  }
}