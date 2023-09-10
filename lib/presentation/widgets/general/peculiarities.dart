import 'package:flutter/material.dart';
import 'package:test_app/config/themes/theme.dart';

class Peculiarities extends StatelessWidget {
  const Peculiarities({ 
    super.key, 
    this.peculiarities = const []
  });

  final List<String> peculiarities;

  @override
  Widget build(BuildContext context){
    return Container(
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: List.generate(
          peculiarities.length, 
          (index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.peculiarity
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

            child: Text(
              peculiarities[index], 
              style: AppFonts.bodyBold.copyWith(color: AppColors.grey),
            )
          )
        ),
      ),
    );
  }
}