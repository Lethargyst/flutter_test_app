import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_app/config/router/app_router.dart';
import 'package:test_app/config/themes/theme.dart';
import 'package:test_app/domain/entities/room.dart';
import 'package:test_app/presentation/widgets/general/general.dart';
import 'package:test_app/utils/extensions/int_separator.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({ 
    required this.room
  });

  final Room room;

  @override
  Widget build(BuildContext context){
    return PrimaryContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [          
          ImageCarousel.fromUri(
            uris: room.imageUrls 
          ),

          const SizedBox(height: 8),

          Text(room.name, style: AppFonts.title),

          const SizedBox(height: 8),

          Peculiarities(peculiarities: room.peculiarities),
          
          const SizedBox(height: 8),

          SecondaryButton(
            title: 'Подробнее о номере',
          ),

          const SizedBox(height: 16),
        
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              Text('${room.price.toInt().separated()} ₽', style: AppFonts.large),

              const SizedBox(width: 8),

              Text(room.pricePer, style: AppFonts.body.copyWith(
                color: AppColors.grey
              ))
            ],
          ),

          const SizedBox(height: 16),

          PrimaryButton(
            title: 'Выбрать номер',
            onTap: () => context.router.push(OrderRoute()),
          )
        ],
      ),
    );
  }
}