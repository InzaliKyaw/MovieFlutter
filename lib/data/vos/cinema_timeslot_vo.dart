import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'timeslots_vo.dart';
part 'cinema_timeslot_vo.g.dart';

@JsonSerializable()
class CinemaTimeSlotVO{
  @JsonKey(name: "cinema_id")
  @HiveField(0)
  int? cinemaId;

  @JsonKey(name: "cinema")
  @HiveField(1)
  String? cinema;

  @JsonKey(name: "timeslots")
  @HiveField(2)
  List<TimeslotVO>? timeslot;

  @HiveField(3)
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool? isSelected;

  CinemaTimeSlotVO(
      this.cinemaId,
      this.cinema,
      this.timeslot,{
        this.isSelected = false,
      }
      );

  factory CinemaTimeSlotVO.fromJson(Map<String, dynamic> json) => _$CinemaTimeSlotVOFromJson(json);

  Map<String, dynamic> toJson() => _$CinemaTimeSlotVOToJson(this);
}