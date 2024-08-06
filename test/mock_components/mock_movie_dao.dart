import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/persistance/daos/movie_dao.dart';
import 'package:rxdart/rxdart.dart';

class MockMovieDao extends MovieDao{

  final BehaviorSubject<List<MovieVO>> _mockMovieDatabaseSubject = BehaviorSubject.seeded([]);

  @override
  MovieVO? getMovieById(int movieId) {
    return _mockMovieDatabaseSubject.value.firstWhere((movie)=> movie.id == movieId);
  }

  @override
  List<MovieVO> getMoviesByType(String type) {
    return _mockMovieDatabaseSubject.value.where((movie)=> movie.type == type).toList();
  }

  @override
  void saveMovies(List<MovieVO> movies) {
    /// Curly braces ka map
    List<MovieVO> currentmovies = _mockMovieDatabaseSubject.value;
    currentmovies.addAll(movies);
    _mockMovieDatabaseSubject.add(movies);
  }

  @override
  void saveSingleMovie(MovieVO moviesVO) {
    List<MovieVO> currentMovies = _mockMovieDatabaseSubject.value;
    currentMovies.add(moviesVO);
    _mockMovieDatabaseSubject.add(currentMovies);
  }

  @override
  Stream<void> watchMovieBox() {
    return _mockMovieDatabaseSubject.stream;
  }

}