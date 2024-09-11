// import 'package:flutter/cupertino.dart';
// import 'package:the_movie_app_padc/network/api_constants.dart';
// import 'package:dio/dio.dart';
// import 'package:the_movie_app_padc/network/data_agent/movie_booking_data_agent.dart';
//
// class DioMovieDataAgentImpl extends TheMovieBookingDataAgent{
//
//   @override
//   void getCreditsByMovie() {
//
//   }
//
//   @override
//   void getMovieDetails() {
//
//   }
//
//   @override
//   void getComingSoonMovies(int page) {
//   }
//
//   @override
//   void getNowPlayingMovie(int page) {
//     Map<String, String> queryParameters = {kParamApiKey: kApiKey, kParamLanguage: kLanguageENUS, kParamPage: page.toString()};
//     Dio().get("$kBaseUrl$kEndPointGetNowPlaying", queryParameters: queryParameters).then((value){
//       debugPrint("Now Playing Movies ========> ${value.toString()}");
//     }).catchError((error){
//       debugPrint("Error ========> ${error.toString()}");
//
//     });
//   }
//
//
//
// }