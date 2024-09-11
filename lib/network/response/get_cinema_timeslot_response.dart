import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_app_padc/data/vos/cinema_timeslot_vo.dart';
part 'get_cinema_timeslot_response.g.dart';

@JsonSerializable()
class GetCinemaDayTimeSlotResponse{

  @JsonKey(name: "code")

  int? code;

  @JsonKey(name:"message")
  String? message;

  @JsonKey(name:"data")
  List<CinemaTimeSlot>? data;

  GetCinemaDayTimeSlotResponse({this.code,this.message, this.data});

  factory GetCinemaDayTimeSlotResponse.fromJson(Map<String, dynamic> json) => _$GetCinemaDayTimeSlotResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCinemaDayTimeSlotResponseToJson(this);
}