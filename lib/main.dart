import 'package:flutter/material.dart';

import 'package:the_movie_app_padc/network/data_agent/movie_booking_data_agent.dart';
import 'package:the_movie_app_padc/network/data_agent/retrofit_data_agent_impl.dart';
import 'package:the_movie_app_padc/pages/splash_page.dart';
import 'package:the_movie_app_padc/utils/colors.dart';

void main() async{

  TheMovieBookingDataAgent dataAgent = RetrofitDataAgentImpl();
  dataAgent.getNowPlayingMovie("1");


  // await Hive.initFlutter();
  // Hive.registerAdapter(CollectionVOAdapter());
  // Hive.registerAdapter(GenreVOAdapter());
  // Hive.registerAdapter(MovieVOAdapter());
  // Hive.registerAdapter(ProductionCompanyVOAdapter());
  // Hive.registerAdapter(ProductionCountryVOAdapter());
  // Hive.registerAdapter(SpokenLanguageVOAdapter());
  // try{
  //   await Hive.openBox<MovieVO>("kBoxNameMovieVO");
  //   print("OPENING BOX ======>");
  // }catch(e) {
  //   debugPrint("HIVE ERROR ====> " +e.toString());
  // }
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
