import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:the_movie_app_padc/data/vos/city_vo.dart';
import 'package:the_movie_app_padc/data/vos/credit_vo.dart';
import 'package:the_movie_app_padc/data/vos/error_vo.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/exception/custom_exception.dart';
import 'package:the_movie_app_padc/network/api_constants.dart';
import 'package:the_movie_app_padc/network/data_agent/movie_booking_data_agent.dart';
import 'package:the_movie_app_padc/network/response/get_cinema_timeslot_response.dart';
import 'package:the_movie_app_padc/network/response/get_otp_response.dart';
import 'package:the_movie_app_padc/network/response/get_seat_response.dart';
import 'package:the_movie_app_padc/network/response/get_snack_response.dart';
import 'package:the_movie_app_padc/network/response/the_movie_booking_api.dart';

class RetrofitDataAgentImpl extends TheMovieBookingDataAgent {
  late TheMovieBookingApi mApi;

  static RetrofitDataAgentImpl? _singleton;

  factory RetrofitDataAgentImpl() {
    _singleton ??= RetrofitDataAgentImpl._internal();
    return _singleton!;
  }

  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    mApi = TheMovieBookingApi(dio);
  }

  @override
  Future<List<MovieVO>> getComingSoonMovies(String page) {
    return mApi
        .getComingSoonMovies(kApiKey, kLanguageENUS, page)
        .asStream()
        .map((response) => response?.results ?? [])
        .first
        .catchError((error) {
      throw _createException(error);
    });
  }

  @override
  Future<List<CreditVO>> getCreditsByMovie(String movieId) {
    return mApi
        .getCreditByMovie(movieId, kApiKey, kLanguageENUS, 1.toString())
        .asStream()
        .map((response) => response?.cast ?? [])
        .first
        .catchError((error) {
      throw _createException(error);
    });
  }

  @override
  Future<MovieVO> getMovieDetails(String movieId) {
    return mApi.getMovieDetails(movieId, kApiKey, kLanguageENUS)
        .catchError((error){
      throw _createException(error);
    });
  }

  @override
  Future<GetOTPResponse> getOTP(String phNumber) {
    return mApi.getOTP(phNumber)
        .catchError((error) {
      throw _createException(error);
    });
  }

  @override
  Future<List<MovieVO>> getNowPlayingMovie(String page) {
    return mApi
        .getNowPlayingMovies(kApiKey, kLanguageENUS, page)
        .asStream()
        .map((response) => response?.results ?? [])
        .first
        .catchError((error){
      throw _createException(error);
    });
  }

  @override
  Future<GetOTPResponse> getCheckOTP(String phNumber, String otp) {
    return mApi.getCheckOTP(phNumber,otp)
        .catchError((error) {
      throw _createException(error);
    });
  }

  @override
  Future<List<CityVO>> getCities() {
    return mApi.getCities()
        .asStream()
        .map((response) => response?.cities ?? [])
        .first
        .catchError((error){
      throw _createException(error);
    });
  }

  @override
  Future<GetCinemaDayTimeSlotResponse> getCinemaDayTimeSlot(String date, String token) {
    return mApi.getCinemaDayTimeSlot(date, token)
        .catchError((error){
      throw _createException(error);
    });
  }


  CustomException _createException(dynamic error) {
    ErrorVO errorVO;
    if (error is DioException) {
      errorVO = _parseDioError(error);
    } else {
      errorVO = ErrorVO(
          statusCode: 0, statusMessage: "Unexpected error", success: false);
    }
    return CustomException(errorVO);
  }

  /// String htote -> Map<String, dynamic> pyg -> pyi mha ErrorVO
  ErrorVO _parseDioError(DioException error) {
    try {
      if (error.response != null && error.response?.data != null) {
        var data = error.response?.data;

        /// Json String to Map<String, dynamic>
        if (data is String) {
          data = jsonDecode(data);
        }

        /// Map<String, dynamic> to ErrorVO
        return ErrorVO.fromJson(data);
      } else {
        return ErrorVO(
            statusCode: 0, statusMessage: "No response data", success: false);
      }
    } catch (e) {
      return ErrorVO(
          statusCode: 0,
          statusMessage: "Error parsing DioError: $e",
          success: false);
    }
  }

  @override
  Future<GetSeatResponse> getSeatResponse(String date, int cinemaDayTimeslotId, String token) {
    return mApi.getSeat(date, cinemaDayTimeslotId, token)
        .catchError((error){
      throw _createException(error);
    });
  }

  @override
  Future<GetSnackResponse> getSnackResponse(String token) {
    return mApi.getSnack(token)
        .catchError((error){
      throw _createException(error);
    });
  }

}
