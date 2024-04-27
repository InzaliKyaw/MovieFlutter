import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_app_padc/data/vos/seat_plan_vo.dart';
part 'get_seat_response.g.dart';

@JsonSerializable()
class GetSeatResponse{

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<List<SeatPlanVO>>? seatPlanList;

  GetSeatResponse(this.code, this.message, this.seatPlanList);

  factory GetSeatResponse.fromJson(Map<String, dynamic> json) => _$GetSeatResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSeatResponseToJson(this);
}