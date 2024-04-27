import 'package:json_annotation/json_annotation.dart';
part 'seat_plan_vo.g.dart';

@JsonSerializable()
class SeatPlanVO{

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: "seat_name")
  String? seatName;

  @JsonKey(name: "symbol")
  String? symbol;

  @JsonKey(name: "price")
  int? price;

  SeatPlanVO(this.id, this.type, this.seatName, this.symbol, this.price);

  factory SeatPlanVO.fromJson(Map<String, dynamic> json) => _$SeatPlanVOFromJson(json);

  Map<String, dynamic> toJson() => _$SeatPlanVOToJson(this);
}