import 'package:flutter/material.dart';
import 'package:test_app/config/router/app_router.dart';
import 'package:test_app/config/themes/colors.dart';

class App extends StatelessWidget {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.stroke
      ),
      routerConfig: appRouter.config(),

      builder: (context, child) => ScrollConfiguration(
        behavior: OverScrollGlowBlocker(), 
        child: child!
      ),
    );
  }
}

class OverScrollGlowBlocker extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
