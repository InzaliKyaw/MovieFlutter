import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/network/api_constants.dart';
import 'package:the_movie_app_padc/network/response/get_city_response.dart';
import 'package:the_movie_app_padc/network/response/get_credits_by_movie_response.dart';
import 'package:the_movie_app_padc/network/response/get_otp_response.dart';
import 'package:the_movie_app_padc/network/response/movie_list_response.dart';
import 'get_cinema_timeslot_response.dart';
import 'get_seat_response.dart';
import 'get_snack_response.dart';
part 'the_movie_booking_api.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class TheMovieBookingApi{
  factory TheMovieBookingApi(Dio dio) = _TheMovieBookingApi;

  @GET(kEndPointGetNowPlaying)
  Future<MovieListResponse?> getNowPlayingMovies(
      @Query(kParamApiKey) String apiKey,
      @Query(kParamLanguage) String language,
      @Query(kParamPage) String page);

  @GET(kEndPointGetUpcoming)
  Future<MovieListResponse?> getComingSoonMovies(
      @Query(kParamApiKey) String apikey,
      @Query(kParamLanguage) String language,
      @Query(kParamPage) String page
      );

  @GET("$kEndPointMovieDetails/{movie_id}")
  Future<MovieVO> getMovieDetails(
      @Path("movie_id") String movieId,
      @Query(kParamApiKey) String apiKey,
      @Query(kParamLanguage) String language
      );

  @GET("$kEndPointGetCreditByMovie/{movie_id}/credits")
  Future<GetCreditsByMovieResponse?> getCreditByMovie(
      @Path("movie_id") String movieId,
      @Query(kParamApiKey) String apiKey,
      @Query(kParamLanguage) String language,
      @Query(kParamPage) String page
      );

  @POST(kEndPointCheckOTP)
  Future<GetOTPResponse> getCheckOTP(
      @Query(kParamPhone) String phoneNo,
      @Query(kParamOtp) String otp);

  @POST(kEndPointGetOTP)
  Future<GetOTPResponse> getOTP(
      @Query("phone") String phoneNo);

  @GET(kEndPointGetCities)
  Future<GetCityResponse> getCities();

  // Get Cinema Day Time Slot
  // Add Header
  @GET("$kEndPointGetCinemaTimeSlot")
  Future<GetCinemaDayTimeSlotResponse> getCinemaDayTimeSlot(
       @Query(kDate) String date,
      String token);

  // Get Seat Plan
  // Add Header
  @GET(kEndPointGetSeatPlan)
  Future<GetSeatResponse> getSeat(
      @Query(kBookingDate) String date,
      @Query(kCinemaDayTimeSlot) int daytimeId,
      String token
      );

  // Get Snack
  // Add Header
  @GET(kEndPointGetSnackPlan)
  Future<GetSnackResponse> getSnack(String token);
}