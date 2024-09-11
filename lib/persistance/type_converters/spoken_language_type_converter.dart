import 'dart:convert';
import 'package:the_movie_app_padc/data/vos/spoken_language_vo.dart';
import 'package:floor/floor.dart';

class SpokenLanguageListConverter extends TypeConverter<List<SpokenLanguageVO>?,String?>{

  @override
  List<SpokenLanguageVO>? decode(String? databaseValue){
    if(databaseValue == null){
      return null;
    }
    List<Map<String, dynamic>> decodedList = json.decode(databaseValue);
    List<SpokenLanguageVO> spokenLanguages = decodedList.map((model){
      return SpokenLanguageVO.fromJson(model);
    }).toList();
    return spokenLanguages;
  }

  @override
  String? encode(List<SpokenLanguageVO>? value){
    if(value == null){
      return null;
    }
    return json.encode(value.map((language) => language.toJson()).toList());
  }

}