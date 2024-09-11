
import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:the_movie_app_padc/data/vos/genre_vo.dart';

class GenreListConverter extends TypeConverter<List<GenreVO>?, String?>{
  
  @override
  List<GenreVO>? decode(String? databaseValue) {
    if(databaseValue == null){
      return null;
    }
    Iterable<Map<String, dynamic>> decodedList = json.decode(databaseValue);
    List<GenreVO> genres = decodedList.map((model){
      return GenreVO.fromJson(model);
    }).toList();
    return genres;
  }

  @override
  String? encode(List<GenreVO>? value) {
    if(value == null){
      return null;
    }
    return json.encode(value.map((genre) => genre.toJson()).toList());
  }

}