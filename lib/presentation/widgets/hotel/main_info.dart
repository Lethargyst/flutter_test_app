import 'package:flutter/material.dart';
import 'package:test_app/config/themes/theme.dart';
import 'package:test_app/domain/entities/hotel.dart';
import 'package:test_app/presentation/widgets/general/general.dart';
import 'package:test_app/utils/extensions/int_separator.dart';

class MainInfo extends StatelessWidget {
  const MainInfo({
    required this.hotel
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Grade(rating: hotel.rating, ratingName: hotel.ratingName),

          const SizedBox(height: 8),
          
          Text(hotel.name, style: AppFonts.title),
          
          const SizedBox(height: 8),
          
          GestureDetector(
            onTap: (){},
            child: Text(hotel.address, style: AppFonts.smallBold.copyWith(
              color: AppColors.blue
            )),
          ),
          
          const SizedBox(height: 16),

          Wrap(
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              Text('от ${hotel.minimalPrice.toInt().separated()} ₽', style: AppFonts.large),

              const SizedBox(width: 8),

              Text(hotel.priceForIt, style: AppFonts.body.copyWith(
                color: AppColors.grey
              ))
            ],
          ),

          const SizedBox(height: 19)
        ],
      ),
    );
  }
}