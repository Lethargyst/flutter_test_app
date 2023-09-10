import 'package:flutter/material.dart';
import 'package:test_app/config/themes/theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({ 
    super.key, 
    required this.title,
    this.onTap
  });

  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.blue
        ),

        child: Text(
          title, 
          style: AppFonts.button.copyWith(
            color: Colors.white
          ),
          textAlign: TextAlign.center,
        ),
      )
    );
  }
}