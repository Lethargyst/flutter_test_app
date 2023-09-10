import 'package:flutter/material.dart';
import 'package:test_app/config/themes/theme.dart';
import 'package:test_app/presentation/widgets/general/general.dart';

class HotelInfo extends StatelessWidget {
  const HotelInfo({  
    required this.hotelName,
    required this.hotelAddress,
    required this.rating,
    required this.ratingName,
  });

  final String hotelName;
  final String hotelAddress;
  final double rating;
  final String ratingName;

  @override
  Widget build(BuildContext context){
    return PrimaryContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Grade(rating: rating, ratingName: ratingName),

          const SizedBox(height: 8),
          
          Text(hotelName, style: AppFonts.title),
          
          const SizedBox(height: 8),
          
          GestureDetector(
            onTap: (){},
            child: Text(hotelAddress, style: AppFonts.smallBold.copyWith(
              color: AppColors.blue
            )),
          ),
        ],
      ),
    );
  }
}