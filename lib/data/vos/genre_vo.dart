import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_app_padc/persistance/hive_constants.dart';
part 'genre_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIdGenreVO, adapterName: kAdapterNameGenreVO)
class GenreVO extends HiveObject{

  @JsonKey(name: "id")
  @HiveField(0)
  int? id;

  @JsonKey(name: "name")
  @HiveField(1)
  String? name;

  GenreVO(this.id,this.name);


  GenreVO.namedParameter({this.id, this.name});

  factory GenreVO.fromJson(Map<String, dynamic> json) => _$GenreVOFromJson(json);

  Map<String, dynamic> toJson() => _$GenreVOToJson(this);
}