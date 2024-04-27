import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_app_padc/data/vos/snack_vo.dart';
part 'get_snack_response.g.dart';

@JsonSerializable()
class GetSnackResponse{

  @JsonKey(name:"code")
  int? code;

  @JsonKey(name:"message")
  String? message;

  @JsonKey(name:"data")
  List<SnackVO>? snackList;

  GetSnackResponse(this.code, this.message, this.snackList);

  factory GetSnackResponse.fromJson(Map<String, dynamic> json) => _$GetSnackResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSnackResponseToJson(this);
}