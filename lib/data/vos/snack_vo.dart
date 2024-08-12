import 'package:json_annotation/json_annotation.dart';
part 'snack_vo.g.dart';
@JsonSerializable()
class SnackVO{

  @JsonKey(name:"id")
  int? id;

  @JsonKey(name:"name")
  String? name;

  @JsonKey(name:"description")
  String? description;

  @JsonKey(name:"price")
  int price;

  @JsonKey(name:"category_id")
  int? categoryId;

  @JsonKey(name:"image")
  String? snackUrl;

  @JsonKey(includeFromJson: false, includeToJson: false)
  int quantity;

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool isAddBtnVisible;

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool isPlusMinusVisible;

  SnackVO(this.id, this.name, this.description, this.price, this.categoryId,
      this.snackUrl,{
    this.quantity = 0,
    this.isAddBtnVisible = true,
    this.isPlusMinusVisible = false
  } );

  factory SnackVO.fromJson(Map<String, dynamic> json) => _$SnackVOFromJson(json);

  Map<String, dynamic> toJson() => _$SnackVOToJson(this);
}