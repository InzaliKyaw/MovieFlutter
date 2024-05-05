


import 'package:the_movie_app_padc/data/models/movie_booking_model.dart';
import 'package:the_movie_app_padc/redux/actions/coming_soon_movies_received.dart';
import 'package:the_movie_app_padc/redux/actions/fetch_coming_soon_movies_from_network.dart';
import 'package:the_movie_app_padc/redux/actions/fetch_now_playing_movies_from_network.dart';
import 'package:the_movie_app_padc/redux/actions/listen_to_coming_soon_movies_action.dart';
import 'package:the_movie_app_padc/redux/actions/listen_to_now_playing_movies_action.dart';
import 'package:the_movie_app_padc/redux/actions/now_playing_movies_received.dart';

// void movieMiddleware(Store<AppState> store, action, NextDispatcher next){
//   if(action is ListenToNowPlayingMoviesAction){
//     MovieBookingModel().getNowPlayingMoviesFromDatabase().listen((newMovies) {
//       store.dispatch(NowPlayingMoviesReceived(newMovies));
//     });
//   }else if(action is ListenToComingSoonMoviesAction){
//     MovieBookingModel().getComingSoonMoviesFromDatabase().listen((newMovies) {
//       store.dispatch(ComingSoonMoviesReceived(newMovies));
//     });
//   }else if(action is FetchNowPlayingMoviesFromNetwork){
//     MovieBookingModel().getNowPlayingMovies();
//   }else if(action is FetchComingSoonMoviesFromNetworkAction){
//     MovieBookingModel().getComingSoonMovies();
//   }
//   next(action);
// }