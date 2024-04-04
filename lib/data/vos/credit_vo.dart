import 'package:json_annotation/json_annotation.dart';
part 'credit_vo.g.dart';

@JsonSerializable()
class CreditVO{

  @JsonKey(name: "adult")
  bool? adult;

  @JsonKey(name: "gender")
  int? gender;

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "known_for_department")
  String? knownForDepartment;

  @JsonKey(name: "original_name")
  String? originalName;

  @JsonKey(name: "popularity")
  double? popularity;

  @JsonKey(name: "cast_id")
  int? castId;

  @JsonKey(name: "character")
  String? character;

  @JsonKey(name: "credit_id")
  String? creditId;

  @JsonKey(name: "order")
  int? order;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "profile_path")
  String? profilePath;

  CreditVO(
      this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.originalName,
      this.popularity,
      this.castId,
      this.character,
      this.creditId,
      this.order,
      this.name,
      this.profilePath);

  factory CreditVO.fromJson(Map<String, dynamic> json) => _$CreditVOFromJson(json);

  Map<String, dynamic> toJson() => _$CreditVOToJson(this);
}