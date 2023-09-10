// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HotelRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HotelPage(),
      );
    },
    OrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderPage(),
      );
    },
    RoomsRoute.name: (routeData) {
      final args = routeData.argsAs<RoomsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RoomsPage(
          key: args.key,
          hotelName: args.hotelName,
        ),
      );
    },
    SuccessRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SuccessPage(),
      );
    },
  };
}

/// generated route for
/// [HotelPage]
class HotelRoute extends PageRouteInfo<void> {
  const HotelRoute({List<PageRouteInfo>? children})
      : super(
          HotelRoute.name,
          initialChildren: children,
        );

  static const String name = 'HotelRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderPage]
class OrderRoute extends PageRouteInfo<void> {
  const OrderRoute({List<PageRouteInfo>? children})
      : super(
          OrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RoomsPage]
class RoomsRoute extends PageRouteInfo<RoomsRouteArgs> {
  RoomsRoute({
    Key? key,
    required String hotelName,
    List<PageRouteInfo>? children,
  }) : super(
          RoomsRoute.name,
          args: RoomsRouteArgs(
            key: key,
            hotelName: hotelName,
          ),
          initialChildren: children,
        );

  static const String name = 'RoomsRoute';

  static const PageInfo<RoomsRouteArgs> page = PageInfo<RoomsRouteArgs>(name);
}

class RoomsRouteArgs {
  const RoomsRouteArgs({
    this.key,
    required this.hotelName,
  });

  final Key? key;

  final String hotelName;

  @override
  String toString() {
    return 'RoomsRouteArgs{key: $key, hotelName: $hotelName}';
  }
}

/// generated route for
/// [SuccessPage]
class SuccessRoute extends PageRouteInfo<void> {
  const SuccessRoute({List<PageRouteInfo>? children})
      : super(
          SuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccessRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
