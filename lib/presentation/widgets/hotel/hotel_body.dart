import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/domain/entities/hotel.dart';
import 'package:test_app/presentation/cubits/hotel/hotel_cubit.dart';
import 'package:test_app/presentation/widgets/general/general.dart';
import 'package:test_app/presentation/widgets/hotel/detailed_info.dart';
import 'package:test_app/presentation/widgets/hotel/main_info.dart';

class HotelBody extends StatelessWidget {
  const HotelBody({ super.key });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        if (state.status == Status.loading || state.status == Status.initial) {
          return Center(
            child: CircularProgressIndicator()
          );
        }

        final Hotel hotel = state.hotel!;

        return SingleChildScrollView(
          child: Column(
            children: [
              const PrimaryAppBar(title: 'Отель'),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  color: Colors.white
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageCarousel.fromUri(
                      uris: hotel.imageUrls,
                    ),

                    const SizedBox(height: 15),

                    MainInfo(hotel: hotel)
                  ],
                ),
              ),

              const SizedBox(height: 10),

              DetailedInfo(hotel: hotel),

              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }
}