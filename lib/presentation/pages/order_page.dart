import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/config/router/app_router.dart';
import 'package:test_app/presentation/blocs/order/order_bloc.dart';
import 'package:test_app/presentation/widgets/general/general.dart';
import 'package:test_app/presentation/widgets/order/order_body.dart';

@RoutePage()
class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderBloc()..add(OrderFetchedEvent()),
      child: BlocListener<OrderBloc, OrderState>(
        listener: (context, state) {
          if (state.isValid)
            context.router.push(SuccessRoute());
        },
        child: SafeArea(
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  floating: true,
                  automaticallyImplyLeading: false,
                  scrolledUnderElevation: 0.0,
                  flexibleSpace: PrimaryAppBar(
                    title: 'Бронироване',
                    enablePop: true,
                  ),
                ),
                const OrderBody()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
