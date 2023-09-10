import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/config/themes/theme.dart';

class InfoButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.peculiarity
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          _InfoButton(icon: 'assets/icons/emoji-happy.svg', title: 'Удобства'),

          Divider(),

          _InfoButton(icon: 'assets/icons/tick-square.svg', title: 'Удобства'),

          Divider(),

          _InfoButton(icon: 'assets/icons/close-square.svg', title: 'Удобства')
        ],
      ),
    );
  }
}

class _InfoButton extends StatelessWidget {
  const _InfoButton({ 
    required this.icon,
    required this.title
  });

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),

        const SizedBox(width: 12),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppFonts.bodyBold),
            Text('Самое необходимое', style: AppFonts.smallBold.copyWith(
              color: AppColors.grey
            ))
          ],
        ),

        Expanded(child: Container()),

        Icon(Icons.navigate_next_rounded)
      ],
    );
  }
}