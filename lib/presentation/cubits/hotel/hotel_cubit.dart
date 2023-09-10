import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_app/domain/entities/hotel.dart';
import 'package:test_app/domain/repositories/hotel_repository.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(HotelState());

  final repository = HotelRepository();

  void fetchHotelInfo() async {
    emit(HotelState(status: Status.loading));
    debugPrint('Fetching hotel...');

    final hotel = await repository.fetchHotel();
    
    debugPrint('Hotel successfully fetched!');
    emit(HotelState(
      status: Status.success,
      hotel: hotel
    ));
  }  
}
