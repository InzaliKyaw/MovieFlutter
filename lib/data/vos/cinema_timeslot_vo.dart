import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'timeslots_vo.dart';
part 'cinema_timeslot_vo.g.dart';

@JsonSerializable()
class CinemaTimeSlot{
  @JsonKey(name: "cinema_id")
  @HiveField(0)
  int? cinemaId;

  @JsonKey(name: "cinema")
  @HiveField(1)
  String? cinema;

  @JsonKey(name: "timeslots")
  @HiveField(2)
  List<TimeslotVO>? timeslot;

  CinemaTimeSlot(
      this.cinemaId,
      this.cinema,
      this.timeslot
      );

  factory CinemaTimeSlot.fromJson(Map<String, dynamic> json) => _$CinemaTimeSlotFromJson(json);

  Map<String, dynamic> toJson() => _$CinemaTimeSlotToJson(this);
}