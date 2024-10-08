import 'package:the_movie_app_padc/data/vos/city_vo.dart';
import 'package:the_movie_app_padc/data/vos/credit_vo.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/network/response/get_cinema_timeslot_response.dart';
import 'package:the_movie_app_padc/network/response/get_otp_response.dart';
import 'package:the_movie_app_padc/network/response/get_seat_response.dart';
import 'package:the_movie_app_padc/network/response/get_snack_response.dart';

abstract class TheMovieBookingDataAgent{
  Future<List<MovieVO>> getNowPlayingMovie(String page);

  Future<List<MovieVO>> getComingSoonMovies(String page);

  Future<MovieVO> getMovieDetails(String movieId);

  Future<List<CreditVO>> getCreditsByMovie(String movieId);

  Future<GetOTPResponse> getOTP(String phNumber);

  Future<GetOTPResponse> getCheckOTP(String phNumber, String otp);

  Future<List<CityVO>> getCities();

  Future<GetCinemaDayTimeSlotResponse> getCinemaDayTimeSlot(String date, String token);

  Future<GetSeatResponse> getSeatResponse(String date,  int cinemaDayTimeslotId, String token);

  Future<GetSnackResponse> getSnackResponse(String token);

}