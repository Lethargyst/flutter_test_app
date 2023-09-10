import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable()
class RoomModel {
  const RoomModel({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls
  });
  
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'price')
  final double price;
  @JsonKey(name: 'price_per')
  final String pricePer;
  @JsonKey(name: 'peculiarities')
  final List<String> peculiarities;
  @JsonKey(name: 'image_urls')
  final List<Uri> imageUrls;

  factory RoomModel.fromJson(Map<String, dynamic> json) => 
    _$RoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomModelToJson(this);
}
