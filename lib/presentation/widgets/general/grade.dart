
import 'package:flutter/material.dart';
import 'package:test_app/config/themes/colors.dart';
import 'package:test_app/config/themes/theme.dart';

class Grade extends StatelessWidget {
  const Grade({ 
    super.key,
    required this.rating,
    required this.ratingName
  });

  final double rating;
  final String ratingName;

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.grade,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: AppColors.gradeText),
          Text(
            '${rating.toInt()} $ratingName', 
            style: AppFonts.body.copyWith(color: AppColors.gradeText)
          )
        ],
      ),
    );
  }
}