import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:the_movie_app_padc/network/api_constants.dart';
import 'get_cinema_timeslot_response.dart';
import 'get_city_response.dart';
import 'get_otp_response.dart';
import 'get_seat_response.dart';
import 'get_snack_response.dart';
part 'cinema_booking_api.g.dart';

@RestApi(baseUrl: kBaseUrlMovieCinema)
abstract class CinemaBookingApi{
  factory CinemaBookingApi(Dio dio) = _CinemaBookingApi;
  @POST(kEndPointCheckOTP)
  Future<GetOTPResponse> getCheckOTP(
      @Query(kParamPhone) String phoneNo,
      @Query(kParamOtp) String otp);

  @POST(kEndPointGetOTP)
  Future<GetOTPResponse> getOTP(
      @Query("phone") String phoneNo);

  @GET(kEndPointGetCities)
  Future<GetCityResponse> getCities();

  // Get Seat Plan
  // Add Header
  @GET(kEndPointGetSeatPlan)
  Future<GetSeatResponse> getSeat(
      @Query(kBookingDate) String date,
      @Query(kCinemaDayTimeSlot) int daytimeId,
      String token
      );

  // Get Cinema Day Time Slot
  // Add Header
  @GET("$kEndPointGetCinemaTimeSlot")
  Future<GetCinemaDayTimeSlotResponse> getCinemaDayTimeSlot(
      @Query(kDate) String date,
      String token);

  // Get Snack
  // Add Header
  @GET(kEndPointGetSnackPlan)
  Future<GetSnackResponse> getSnack(String token);
}