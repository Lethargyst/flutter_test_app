import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_app/domain/entities/room.dart';
import 'package:test_app/domain/repositories/rooms_repository.dart';

part 'rooms_state.dart';

class RoomsCubit extends Cubit<RoomsState> {
  RoomsCubit() : super(RoomsState());

  final repository = RoomsRepository();

  void fetchRoomsInfo() async {
    emit(RoomsState(status: Status.loading));
    debugPrint('Fetching rooms...');

    final rooms = await repository.fetchRooms();

    debugPrint('Rooms succesfully fetched!');
    emit(RoomsState(
      status: Status.success,
      rooms: rooms
    ));
  }  
}
