import 'package:flutter/cupertino.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

/// AppState is immutable
/// AppState will be created from constructor
class AppState{
  final List<MovieVO> nowPlayingMovies;
  final List<MovieVO> comingSoonMovies;
  final List<MovieVO> moviesToShow;
  final String selectedMovieType;

  AppState.newState({
    required this.nowPlayingMovies,
    required this.comingSoonMovies,
    required this.moviesToShow,
    required this.selectedMovieType
});

  AppState.initial({
     this.nowPlayingMovies = const [],
     this.comingSoonMovies = const [],
     this.moviesToShow = const [],
     this.selectedMovieType = kNowShowingLabel
  });
}