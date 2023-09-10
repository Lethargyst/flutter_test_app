import 'package:flutter/material.dart';
import 'package:test_app/config/themes/theme.dart';
import 'package:test_app/domain/entities/hotel.dart';
import 'package:test_app/presentation/widgets/general/general.dart';
import 'package:test_app/presentation/widgets/hotel/info_buttons.dart';

class DetailedInfo extends StatelessWidget {
  const DetailedInfo({
    required this.hotel
  });

  final Hotel hotel;

  @override
  Widget build(BuildContext context){
    return PrimaryContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Об отеле', style: AppFonts.title),

          const SizedBox(height: 16),

          Peculiarities(peculiarities: hotel.peculiarities),

          const SizedBox(height: 12),

          Text(hotel.description, style: AppFonts.body),

          const SizedBox(height: 16),

          InfoButtons()
        ],
      ),
    );
  }
}