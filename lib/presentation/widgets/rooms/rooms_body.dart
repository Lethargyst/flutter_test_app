import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/domain/entities/room.dart';
import 'package:test_app/presentation/cubits/rooms/rooms_cubit.dart';
import 'package:test_app/presentation/widgets/rooms/room_card.dart';

class RoomsBody extends StatelessWidget {
  const RoomsBody({ super.key });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomsCubit, RoomsState>(
      builder: (context, state) {
        if (state.status == Status.loading || state.status == Status.initial) {
          return SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator()
            ),
          );
        }

        final List<Room> rooms = state.rooms!;

        return SliverList.separated(
          itemCount: rooms.length,
          itemBuilder: (context, index) => RoomCard(room: rooms[index]), 
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        );
      },
    );
  }
}