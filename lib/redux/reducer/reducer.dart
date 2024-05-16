
import 'package:the_movie_app_padc/redux/actions/coming_soon_movies_received.dart';
import 'package:the_movie_app_padc/redux/actions/now_playing_movies_received.dart';
import 'package:the_movie_app_padc/redux/actions/switch_movie_action.dart';
import 'package:the_movie_app_padc/redux/app_state.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

AppState reducer(AppState oldState, dynamic action){
  if(action is NowPlayingMoviesReceived){
    return AppState.newState(
        nowPlayingMovies: action.movies,
        comingSoonMovies: oldState.comingSoonMovies,
        moviesToShow: (oldState.moviesToShow.isEmpty)? action.movies: oldState.moviesToShow,
        selectedMovieType: oldState.selectedMovieType);
  }else if(action is ComingSoonMoviesReceived){
    return AppState.newState(
        nowPlayingMovies: oldState.nowPlayingMovies,
        comingSoonMovies: action.movies,
        moviesToShow:  oldState.moviesToShow,
        selectedMovieType: oldState.selectedMovieType);
  }else if(action is SwitchMovieAction){
    if(action.movieType == kNowShowingLabel){
      return AppState.newState(
          nowPlayingMovies: oldState.nowPlayingMovies,
          comingSoonMovies: oldState.comingSoonMovies,
          moviesToShow:  oldState.moviesToShow,
          selectedMovieType: kComingSoonLabel);
    }
  }
  return oldState;
}