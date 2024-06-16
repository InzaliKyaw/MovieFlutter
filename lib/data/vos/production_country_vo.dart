import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_app_padc/persistance/hive_constants.dart';
part 'production_country_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIdProductionCountryVO, adapterName: kAdapterNameProductionCountryVO)
class ProductionCountryVO extends HiveObject{

  @JsonKey(name: "iso_3166_1")
  @HiveField(0)
  String? is031661;

  @JsonKey(name: "name")
  @HiveField(1)
  String? name;

  ProductionCountryVO(this.is031661, this.name);


  ProductionCountryVO.namedParameters({this.is031661, this.name});

  factory ProductionCountryVO.fromJson(Map<String, dynamic> json) => _$ProductionCountryVOFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryVOToJson(this);
}