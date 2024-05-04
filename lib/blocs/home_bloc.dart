import 'dart:async';
import 'package:the_movie_app_padc/data/models/movie_booking_model.dart';
import 'package:the_movie_app_padc/utils/strings.dart';
import 'package:rxdart/rxdart.dart';
import '../data/vos/movie_vo.dart';

class HomeBloc{

  /// Model
  final MovieBookingModel _model = MovieBookingModel();

  /// Now Showing or Coming Soon
  BehaviorSubject<String> selectedTextSubject = BehaviorSubject();

  /// Now Playing Movies
  List<MovieVO> nowPlayingMovies = [];

  /// Coming Soon Movies
  List<MovieVO> comingSoonMovies = [];

  /// Movies To Show
  BehaviorSubject<List<MovieVO>> moviesToShowBehaviorSubject = BehaviorSubject();

  StreamSubscription? _nowPlayingMoviesSubscription;
  StreamSubscription? _comingSoonMoviesSubscription;

  HomeBloc(){
    /// Selected text will initially be Bow Playing
    selectedTextSubject.add(kNowShowingLabel);

    /// Now Playing Movies From Database
    _nowPlayingMoviesSubscription = _model.getNowPlayingMoviesFromDatabase().listen((nowPlayingMovieFromDB) {
      nowPlayingMovies = nowPlayingMovieFromDB;
      if(moviesToShowBehaviorSubject.valueOrNull?.isEmpty ?? true){
        moviesToShowBehaviorSubject.add(nowPlayingMovieFromDB);
      }
    });


    /// Coming Soon Movies From Database
    _comingSoonMoviesSubscription = _model.getComingSoonMoviesFromDatabase().listen((comingSoonMoviesFromDatabase) {
      comingSoonMovies = comingSoonMoviesFromDatabase;
    });

    /// Now Playing Movies From Network
    _model.getNowPlayingMovies();

    /// Coming Soon Movies from Network
    _model.getComingSoonMovies();
  }

  void onTapNowShowingOrComingSoon(String text){

    /// Set Now Playing Or Coming Soon
    selectedTextSubject.add(text);
    /// Set Movies
    if (text == kNowShowingLabel){
      moviesToShowBehaviorSubject.add(nowPlayingMovies);
    }else{
      moviesToShowBehaviorSubject.add(comingSoonMovies);
    }
  }

  void onDispose(){
    _nowPlayingMoviesSubscription?.cancel();
    _comingSoonMoviesSubscription?.cancel();
  }

}