// import 'package:the_movie_app_padc/network/api_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// /// Retrofit code generate
//
// class HttpDataAgentImpl{
//   void getNowPlayingMovies(int page){
//     Map<String, String> queryParameters = {kParamApiKey: kApiKey, kParamLanguage: kLanguageENUS, kParamPage: page.toString()};
//     Uri url = Uri.https(kBaseUrlHttp, kEndPointGetNowPlaying, queryParameters);
//     http.get(url).then((response) {
//       debugPrint("Now Playing Movies ==> ${response.body.toString()}");
//     }).catchError((error){
//        debugPrint("Error ======> ${error.toString()}");
//     });
//
//   }
// }