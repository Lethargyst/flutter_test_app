import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/config/router/app_router.dart';
import 'package:test_app/presentation/cubits/hotel/hotel_cubit.dart';
import 'package:test_app/presentation/widgets/general/general.dart';
import 'package:test_app/presentation/widgets/hotel/hotel_body.dart';

@RoutePage()
class HotelPage extends StatelessWidget {
  const HotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelCubit()..fetchHotelInfo(),
      child: SafeArea(
        child: Scaffold(
          body: const HotelBody(),
          bottomNavigationBar: BlocBuilder<HotelCubit, HotelState>(
            builder: (context, state) {
              if (state.status != Status.success)
                return const SizedBox.shrink();
                
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                color: Colors.white,
                child: PrimaryButton(
                  title: 'К выбору номера',
                  onTap: () => context.router.push(
                    RoomsRoute(
                      hotelName:context.read<HotelCubit>().state.hotel!.name
                    )
                  )
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
