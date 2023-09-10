import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/presentation/cubits/rooms/rooms_cubit.dart';
import 'package:test_app/presentation/widgets/general/general.dart';
import 'package:test_app/presentation/widgets/rooms/rooms_body.dart';

@RoutePage()
class RoomsPage extends StatelessWidget {
  const RoomsPage({super.key, required this.hotelName});

  final String hotelName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoomsCubit()..fetchRoomsInfo(),
      child: SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                floating: true,
                automaticallyImplyLeading: false,
                scrolledUnderElevation: 0.0,
                flexibleSpace: PrimaryAppBar(
                  title: hotelName,
                  enablePop: true,
                )
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 8)),

              const RoomsBody(),

              const SliverToBoxAdapter(child: SizedBox(height: 8)),
            ],
          ),
        )
      ),
    );
  }
}
