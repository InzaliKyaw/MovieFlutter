import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';

class MovieDao{
  /// Must be Singleton
  static final MovieDao _singleton = MovieDao._internal();

  factory MovieDao(){
    return _singleton;
  }

  MovieDao._internal();

  void saveMovies(List<MovieVO> movies) async{
    /// Curly braces ka map
    Map<int, MovieVO> movieMap = {for (var movie in movies) (movie.id ?? 0) : movie};
    await getMovieBox().putAll(movieMap);
  }

  void saveSingleMovie(MovieVO movieVO) async{
    return getMovieBox().put(movieVO.id, movieVO);
  }

  Stream<void> watchMovieBox(){
    return getMovieBox().watch();
  }

  List<MovieVO> getMovieByType(String type){
    return getMovieBox().values.where((movie)=> movie.type == type).toList();
  }

  MovieVO? getMovieById(int movieId){
    return getMovieBox().get(movieId);
  }

  Box<MovieVO> getMovieBox(){
    return Hive.box<MovieVO>("kBoxNameMovieVO");
  }
}