
import 'dart:async';

import 'package:scoped_model/scoped_model.dart';
import 'package:the_movie_app_padc/data/models/movie_booking_model.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

class HomeModel extends Model{

  /// Model
  final MovieBookingModel _model = MovieBookingModel();

  /// Now showing or Coming Soon
  String selectedText = kNowShowingLabel;

  /// Now Playing Movies
  List<MovieVO> nowPlayingMovies = [];

  /// Coming Soon Movies
  List<MovieVO> comingSoonMovies = [];


  /// Coming Soon Movies
  List<MovieVO> comingSoonMoviesFromDatabase = [];

  List<MovieVO> nowPlayingMoviesFromDatabase = [];

  /// Movies To Show
  List<MovieVO> moviesToShow = [];

  StreamSubscription? _nowPlayingMoviesSubscription;
  StreamSubscription? _comingSoonMoviesSubscription;

  HomeModel(){
    /// Now Playing Movies From Database
    _nowPlayingMoviesSubscription = _model.getNowPlayingMoviesFromDatabase().listen((event) {
      nowPlayingMovies = nowPlayingMoviesFromDatabase;
    });

    if(moviesToShow.isEmpty){
      moviesToShow = nowPlayingMoviesFromDatabase;
      notifyListeners();
    }

    /// Coming Soon Movies From Database
    _comingSoonMoviesSubscription = _model.getComingSoonMoviesFromDatabase().listen((comingSoonMoviesFromDatabase) {
      comingSoonMovies = comingSoonMoviesFromDatabase;
    });

    /// Now Playing Movies From Network
    _model.getNowPlayingMovies();

    /// Coming Soon Movies From Network
    _model.getComingSoonMovies();
  }

  void onTapNowShowingOrComingSoon(String text){
    /// Set Now Playing or Coming Soon
    selectedText = text;

    /// Set Movies
    if( text == kNowShowingLabel){
      moviesToShow = nowPlayingMovies;
    }else{
      moviesToShow = comingSoonMovies;
    }
    notifyListeners();
  }

  void onDispose(){
    _nowPlayingMoviesSubscription?.cancel();
    _comingSoonMoviesSubscription?.cancel();
  }

}
