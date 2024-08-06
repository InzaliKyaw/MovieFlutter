
import 'package:the_movie_app_padc/data/models/movie_booking_model.dart';
import 'package:the_movie_app_padc/data/vos/credit_vo.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';

import '../mock_data/mock_data.dart';

class MockMovieBookingModel extends MovieBookingModel{
  @override
  Future<List<MovieVO>> getComingSoonMovies() {
    return Future.value(mockComingSoonMovieList);
  }

  @override
  Stream<List<MovieVO>> getComingSoonMoviesFromDatabase() {
    return Stream.value(mockComingSoonMovieList);
  }

  @override
  Future<List<CreditVO>> getCreditsByMovie(String movieId) {
    return Future.value(mockCreditList);
  }

  @override
  Future<MovieVO> getMovieDetails(String movieId) {
    return Future.value(mockMovie);
  }

  @override
  Stream<MovieVO?> getMovieDetailsFromDatabase(String movieId) {
    return Stream.value(mockMovie);
  }

  @override
  Future<List<MovieVO>> getNowPlayingMovies(int page) {
    return Future.value(mockNowPlayingMovieList);
  }

  @override
  Stream<List<MovieVO>> getNowPlayingMoviesFromDatabase() {
    return Stream.value(mockNowPlayingMovieList);
  }

  @override
  Future<List<MovieVO>> getSimilarMovies(int movieId) {
    return Future.value(mockNowPlayingMovieList);
  }

}