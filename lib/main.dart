import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:redux/redux.dart';
import 'package:the_movie_app_padc/data/vos/collection_vo.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/data/vos/production_company_vo.dart';
import 'package:the_movie_app_padc/data/vos/production_country_vo.dart';
import 'package:the_movie_app_padc/data/vos/spoken_language_vo.dart';
import 'package:the_movie_app_padc/network/response/get_otp_response.dart';
import 'package:the_movie_app_padc/pages/splash_page.dart';
import 'package:the_movie_app_padc/redux/actions/fetch_coming_soon_movies_from_network.dart';
import 'package:the_movie_app_padc/redux/actions/fetch_now_playing_movies_from_network.dart';
import 'package:the_movie_app_padc/redux/actions/listen_to_coming_soon_movies_action.dart';
import 'package:the_movie_app_padc/redux/actions/listen_to_now_playing_movies_action.dart';
import 'package:the_movie_app_padc/redux/app_state.dart';
import 'package:the_movie_app_padc/redux/middleware/movieMiddleware.dart';
import 'package:the_movie_app_padc/redux/reducer/reducer.dart';
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

  var store = Store<AppState> (
    reducer,
    initialState: AppState.initial(),
    middleware: [movieMiddleware],
  );


  store.dispatch(FetchNowPlayingMoviesFromNetwork());
  store.dispatch(FetchComingSoonMoviesFromNetworkAction());
  store.dispatch(ListenToNowPlayingMoviesAction());
  store.dispatch(ListenToComingSoonMoviesAction());

  runApp(MovieBookingApp(store: store,));
}



class MovieBookingApp extends StatelessWidget {

  final Store<AppState> store;

  const MovieBookingApp({super.key, required this.store}) ;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: kBackgroundColor
        ),
        home: const SplashPage(),
      ),
    );
  }
}
