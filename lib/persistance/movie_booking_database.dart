import 'package:floor/floor.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/persistance/type_converters/collection_vo_type_converter.dart';
import 'package:the_movie_app_padc/persistance/type_converters/genre_id_list_type_converter.dart';
import 'package:the_movie_app_padc/persistance/type_converters/genre_list_type_converter.dart';
import 'package:the_movie_app_padc/persistance/type_converters/production_company_vo_list_type_converter.dart';
import 'package:the_movie_app_padc/persistance/type_converters/production_country_vo_list_type_converter.dart';
import 'package:the_movie_app_padc/persistance/type_converters/spoken_language_type_converter.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

import 'daos/movie_dao.dart';

// part 'movie_booking_database.g.dart';
//
// @TypeConverters([
//   CollectionVOConverter,
//   GenreIdListTypeConverter,
//   GenreListConverter,
//   ProductionCompanyListTypeConverter,
//   ProductionCountryListTypeConverter,
//   SpokenLanguageListConverter
// ])
//
// @Database(version:1, entities: [MovieVO])
// abstract class MovieBookingDatabase extends FloorDatabase{
//   static Future<MovieBookingDatabase>? _databaseFuture;
//
//   /// singleton pattern
//   static Future<MovieBookingDatabase> get getMovieBookingDatabase async{
//     _databaseFuture ??= $FloorMovieBookingDatabase
//         .databaseBuilder('movie_booking_database.db')
//         .build();
//     return _databaseFuture!;
//   }
//
//   MovieDao get movieDao;
// }