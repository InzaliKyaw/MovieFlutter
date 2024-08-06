
import 'package:the_movie_app_padc/data/vos/city_vo.dart';
import 'package:the_movie_app_padc/data/vos/credit_vo.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/network/data_agent/movie_booking_data_agent.dart';
import 'package:the_movie_app_padc/network/data_agent/retrofit_data_agent_impl.dart';
import 'package:the_movie_app_padc/network/response/get_cinema_timeslot_response.dart';
import 'package:the_movie_app_padc/network/response/get_otp_response.dart';
import 'package:the_movie_app_padc/persistance/daos/movie_dao_d.dart';
import 'package:the_movie_app_padc/persistance/daos/movie_dao.dart';
import 'package:the_movie_app_padc/persistance/daos/movie_dao_impl.dart';
import 'package:the_movie_app_padc/persistance/daos/otp_dao.dart';

abstract class MovieBookingModel {

  Future<List<MovieVO>> getNowPlayingMovies(int page);
  Future<List<MovieVO>> getComingSoonMovies();
  Future<List<MovieVO>> getSimilarMovies(int movieId);
  Future<MovieVO> getMovieDetails(String movieId);
  Stream<List<MovieVO>> getNowPlayingMoviesFromDatabase();
  Stream<List<MovieVO>> getComingSoonMoviesFromDatabase();
  Stream<MovieVO?> getMovieDetailsFromDatabase(String movieId);
  Future<List<CreditVO>> getCreditsByMovie(String movieId);
}


