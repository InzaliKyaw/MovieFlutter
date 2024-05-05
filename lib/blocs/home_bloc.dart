import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:the_movie_app_padc/data/models/movie_booking_model.dart';
import 'package:the_movie_app_padc/utils/strings.dart';
import 'package:rxdart/rxdart.dart';
import '../data/vos/movie_vo.dart';

///Provider package ka
///Change Notifier and Widget lifecycle connect htr tal
/// Bloc ka dispose ka widget ko br dispose lote pay
class HomeBloc extends ChangeNotifier{

  /// Model
  final MovieBookingModel _model = MovieBookingModel();

  /// Now Showing or Coming Soon
  String selectedText = kNowShowingLabel;

  /// Now Playing Movies
  List<MovieVO> nowPlayingMovies = [];

  /// Coming Soon Movies
  List<MovieVO> comingSoonMovies = [];

  /// Movies To Show
  List<MovieVO> moviesToShow = [];

  StreamSubscription? _nowPlayingMoviesSubscription;
  StreamSubscription? _comingSoonMoviesSubscription;

  HomeBloc(){
    /// Now Playing Movies From Database
    _nowPlayingMoviesSubscription = _model.getNowPlayingMoviesFromDatabase().listen((nowPlayingMovieFromDB) {
      nowPlayingMovies = nowPlayingMovieFromDB;
      if(moviesToShow.isEmpty){
        moviesToShow = nowPlayingMovieFromDB;
        notifyListeners();
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


    /// Set Movies
    if (text == kNowShowingLabel){
      moviesToShow = nowPlayingMovies;
    }else{
      moviesToShow = comingSoonMovies;
    }
    notifyListeners();
  }

  void onDispose(){
    _nowPlayingMoviesSubscription?.cancel();
    _comingSoonMoviesSubscription?.cancel();
    super.dispose();
  }

}