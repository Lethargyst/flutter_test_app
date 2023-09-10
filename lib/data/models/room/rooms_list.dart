import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/data/models/room/room.dart';

part 'rooms_list.g.dart';

@JsonSerializable()
final class RoomsListModel {
  const RoomsListModel({
    required this.list
  });
  
  @JsonKey(name: 'rooms')
  final List<RoomModel> list;

  factory RoomsListModel.fromJson(Map<String, dynamic> json) => 
    _$RoomsListModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomsListModelToJson(this);
}
