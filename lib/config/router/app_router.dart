import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_app/presentation/pages/pages.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    RedirectRoute(path: '/', redirectTo: '/hotel'),

    AutoRoute(
      page: HotelRoute.page, 
      path: '/hotel', 
      usesPathAsKey: true,
      initial: true
    ),

    AutoRoute(
      page: RoomsRoute.page, 
      path: '/rooms', 
      usesPathAsKey: true,
    ),

    AutoRoute(
      page: OrderRoute.page, 
      path: '/order', 
      usesPathAsKey: true,
    ),

    AutoRoute(
      page: SuccessRoute.page, 
      path: '/success', 
      usesPathAsKey: true,
    )

  ];  
} 