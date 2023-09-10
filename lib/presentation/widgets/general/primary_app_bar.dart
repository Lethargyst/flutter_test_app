import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_app/config/themes/theme.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar({ 
    super.key,
    required this.title,
    this.enablePop = false
  });

  final String title;
  final bool enablePop;

  @override
  Size get preferredSize => Size.fromHeight(55);

  @override
  Widget build(BuildContext context){
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: enablePop ? InkWell(
        onTap: () => context.router.pop(),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
        ),
      ) : const SizedBox.shrink(),
      title:  Text(title, style: AppFonts.appBar),
    );
  }
}