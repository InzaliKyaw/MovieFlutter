import '../../data/vos/movie_vo.dart';

abstract class MovieDao{
  void saveMovies(List<MovieVO> movies);

  void saveSingleMovie(MovieVO movievo);

  Stream<void> watchMovieBox();

  List<MovieVO> getMoviesByType(String Type);

  MovieVO? getMovieById(int movieId);
}