import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/persistance/daos/movie_dao.dart';

class MovieDaoImpl extends MovieDao{

  /// Must be Singleton
  static final MovieDaoImpl _singleton = MovieDaoImpl._internal();

  factory MovieDaoImpl(){
    return _singleton;
  }

  MovieDaoImpl._internal();

  @override
  MovieVO? getMovieById(int movieId) {
    return getMovieBox().get(movieId);
  }

  @override
  List<MovieVO> getMoviesByType(String type) {
    return getMovieBox().values.where((movie)=> movie.type == type).toList();
  }

  @override
  void saveMovies(List<MovieVO> movies) async{
    /// Curly braces ka map
    Map<int, MovieVO> movieMap = {for (var movie in movies) (movie.id ?? 0) : movie};
    await getMovieBox().putAll(movieMap);
  }

  @override
  void saveSingleMovie(MovieVO movieVO) async{
    return getMovieBox().put(movieVO.id, movieVO);
  }

  @override
  Stream<void> watchMovieBox() {
    return getMovieBox().watch();
  }

  Box<MovieVO> getMovieBox(){
    return Hive.box<MovieVO>("kBoxNameMovieVO");
  }

}