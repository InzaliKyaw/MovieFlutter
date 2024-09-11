import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'timeslots_vo.g.dart';


@JsonSerializable()
class TimeslotVO{

  @JsonKey(name: "cinema_day_timeslot_id")
  @HiveField(0)
  int? cinemaDayTimeslotId;

  @JsonKey(name: "start_time")
  @HiveField(1)
  String? startTime;

  @JsonKey(name: "status")
  @HiveField(2)
  int? status;

  TimeslotVO(this.status, this.startTime, this.cinemaDayTimeslotId);

  factory TimeslotVO.fromJson(Map<String, dynamic> json) => _$TimeslotVOFromJson(json);

  Map<String, dynamic> toJson() => _$TimeslotVOToJson(this);
}