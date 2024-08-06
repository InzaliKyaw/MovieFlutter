import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:the_movie_app_padc/data/models/movie_booking_model.dart';
import 'package:the_movie_app_padc/data/models/movie_booking_model_impl.dart';
import 'package:the_movie_app_padc/data/vos/credit_vo.dart';
import 'dart:async';

import 'package:the_movie_app_padc/data/vos/movie_vo.dart';

class MovieDetailsBloc extends ChangeNotifier{

  /// Model
  final MovieBookingModelImpl _model = MovieBookingModelImpl();

  /// State
  MovieVO? movieDetails;
  List<CreditVO>? creditList;
  List<MovieVO>? mRelatedMovies;

  /// Stream Subscription
  StreamSubscription? _movieDetailsStreamSubscription;

  MovieDetailsBloc(String movieId){
    /// Get Movie Details From Database
    _movieDetailsStreamSubscription = _model.getMovieDetailsFromDatabase(movieId).listen((movieDetailsDB) {
      movieDetails = movieDetailsDB;
      notifyListeners();
    });

    /// Get Movie Details From Network
    // _model.getMovieDetails(movieId).then((_) {});
    _model.getMovieDetails(movieId).then((movie) {
      this.movieDetails = movie;
      this.getRelatedMovies(movie.id ?? 0);
      notifyListeners();
    });


    _model.getCreditsByMovie(movieId).then((credits) {
      creditList = credits;
      notifyListeners();
    });
  }

  /// Get Similar Movies
  void getRelatedMovies(int movieId){
    _model.getSimilarMovies(movieId).then((relatedMovies){
      mRelatedMovies = relatedMovies;
      notifyListeners();
    });
  }

  void relatedMovieListEndReached(int movieId){
    _model.getSimilarMovies(movieId).then((relatedMovies){
      mRelatedMovies = relatedMovies;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _movieDetailsStreamSubscription?.cancel();
    super.dispose();
  }
}