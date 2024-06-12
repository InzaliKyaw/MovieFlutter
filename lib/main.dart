import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_movie_app_padc/data/vos/collection_vo.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/data/vos/production_company_vo.dart';
import 'package:the_movie_app_padc/data/vos/production_country_vo.dart';
import 'package:the_movie_app_padc/data/vos/spoken_language_vo.dart';
import 'package:the_movie_app_padc/network/response/get_otp_response.dart';
import 'package:the_movie_app_padc/pages/splash_page.dart';
import 'package:the_movie_app_padc/utils/colors.dart';

import 'data/vos/genre_vo.dart';

void main() async{

  // TheMovieBookingDataAgent dataAgent = RetrofitDataAgentImpl();
  // dataAgent.getNowPlayingMovie("1");


  await Hive.initFlutter();
  Hive.registerAdapter(CollectionVOAdapter());
  Hive.registerAdapter(GenreVOAdapter());
  Hive.registerAdapter(MovieVOAdapter());
  Hive.registerAdapter(ProductionCompanyVOAdapter());
  Hive.registerAdapter(ProductionCountryVOAdapter());
  Hive.registerAdapter(SpokenLanguageVOAdapter());
  Hive.registerAdapter(OTPVOAdapter());
  try{
    await Hive.openBox<MovieVO>("kBoxNameMovieVO");
    await Hive.openBox<GetOTPResponse>("kBoxNameOTPVO");
    print("OPENING BOX ======>");
  }catch(e) {
    debugPrint("HIVE ERROR ====> " +e.toString());
  }
  runApp(const MovieBookingApp());
}



class MovieBookingApp extends StatelessWidget {
  const MovieBookingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor
      ),
      home: const SplashPage(),
    );
  }
}
