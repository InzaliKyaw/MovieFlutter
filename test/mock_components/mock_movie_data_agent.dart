import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/data/vos/city_vo.dart';
import 'package:the_movie_app_padc/data/vos/credit_vo.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/network/data_agent/movie_booking_data_agent.dart';
import 'package:the_movie_app_padc/network/response/get_cinema_timeslot_response.dart';
import 'package:the_movie_app_padc/network/response/get_otp_response.dart';

import '../mock_data/mock_data.dart';

class MockMovieDataAgent extends TheMovieBookingDataAgent{


  @override
  Future<List<MovieVO>> getComingSoonMovies(String page) {
    return Future.value(mockComingSoonMovieList);
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
  Future<List<MovieVO>> getNowPlayingMovie(String page) {
    return Future.value(mockNowPlayingMovieList);
  }

  @override
  Future<List<MovieVO>> getSearchMovie(String query) {
    return Future.value(mockNowPlayingMovieList);
  }

  @override
  Future<GetOTPResponse> getOTP(String phNumber) {
    throw UnimplementedError();
  }

  @override
  Future<GetOTPResponse> getCheckOTP(String phNumber, String otp) {
    throw UnimplementedError();
  }

  @override
  Future<GetCinemaDayTimeSlotResponse> getCinemaDayTimeSlot(String date, String token) {
    throw UnimplementedError();
  }

  @override
  Future<List<CityVO>> getCities() {
    throw UnimplementedError();
  }

  @override
  Future<List<MovieVO>> getSimilarMovies(int movieId) {
    throw UnimplementedError();
  }


}