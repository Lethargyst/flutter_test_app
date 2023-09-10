import 'package:flutter/material.dart';
import 'package:test_app/config/themes/theme.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({ 
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
        padding: EdgeInsets.fromLTRB(10, 5, 2, 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.lightBlue
        ),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title, 
              style: AppFonts.button.copyWith(
                color: Colors.blue
              ),
              textAlign: TextAlign.center,
            ),

            Icon(Icons.navigate_next_rounded, color: AppColors.blue)
          ],
        ),
      )
    );
  }
}