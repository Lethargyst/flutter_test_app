import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/domain/entities/order.dart';
import 'package:test_app/presentation/blocs/order/order_bloc.dart';
import 'package:test_app/presentation/widgets/general/general.dart';
import 'package:test_app/presentation/widgets/order/customer_info.dart';
import 'package:test_app/presentation/widgets/order/hotel_info.dart';
import 'package:test_app/presentation/widgets/order/order_info.dart';
import 'package:test_app/presentation/widgets/order/summary.dart';
import 'package:test_app/presentation/widgets/order/tourists_form/tourists_form.dart';

class OrderBody extends StatelessWidget {
  const OrderBody({ super.key });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state.status == Status.loading || state.status == Status.initial) {
          return SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator()
            ),
          );
        }
        
        final Order order = state.order!;

        return SliverList.list(
          children: [
            const SizedBox(height: 8),

            HotelInfo(
              hotelName: order.hotelName, 
              hotelAddress: order.hotelAddress, 
              rating: order.horating, 
              ratingName: order.ratingName
            ),

            const SizedBox(height: 8),

            OrderInfo(order: order),

            const SizedBox(height: 8),
          
            CustomerInfo(),

            const SizedBox(height: 8),

            TouristsForm(),

            const SizedBox(height: 8),

            Summary(order: order),

            const SizedBox(height: 8),

            PrimaryContainer(
              borderRadius: BorderRadius.circular(0),
              child: PrimaryButton(
                title: 'Оплатить',
                onTap: () => context.read<OrderBloc>().add(FormValidatedEvent()),
              ),
            )
          ],
        );
      }
    );
  }
}