import 'package:the_movie_app_padc/data/models/movie_booking_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:the_movie_app_padc/data/vos/credit_vo.dart';
import 'dart:async';

import 'package:the_movie_app_padc/data/vos/movie_vo.dart';

class MovieDetailsBloc{

  /// Model
  final MovieBookingModel _model = MovieBookingModel();

  /// State
  BehaviorSubject<MovieVO?> movieDetailsSubject = BehaviorSubject();
  BehaviorSubject<List<CreditVO>?> creditListSubject = BehaviorSubject();

  /// Stream Subscription
  StreamSubscription? _movieDetailsStreamSubscription;

  MovieDetailsBloc(String movieId){
    /// Get Movie Details From Database
    _movieDetailsStreamSubscription = _model.getMovieDetailsFromDatabase(movieId).listen((movieDetailsDB) {
      movieDetailsSubject.add(movieDetailsDB);
    });

    /// Get Movie Details From Network
    _model.getMovieDetails(movieId).then((_) {});

    _model.getCreditsByMovie(movieId).then((credits) {
      creditListSubject.add(credits);
    });
  }

  void onDispose(){
    _movieDetailsStreamSubscription?.cancel();
  }
}