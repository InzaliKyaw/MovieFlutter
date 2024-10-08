import 'dart:convert';
import 'package:floor/floor.dart';

import '../../data/vos/production_country_vo.dart';

class ProductionCountryListTypeConverter extends TypeConverter<List<ProductionCountryVO>?, String?>{

  @override
  List<ProductionCountryVO>? decode(String? databaseValue){
    if(databaseValue == null){
      return null;
    }
    List<Map<String, dynamic>> decodedList = json.decode(databaseValue);

    List<ProductionCountryVO> productionCountries = decodedList.map((model) {
      return ProductionCountryVO.fromJson(model);
    }).toList();
    return productionCountries;
  }

  @override
  String? encode(List<ProductionCountryVO>? value) {
    if(value == null){
      return null;
    }
    return json.encode(value.map((country) => country.toJson()).toList());
  }
}