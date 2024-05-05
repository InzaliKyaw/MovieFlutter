import 'package:flutter/foundation.dart';
import 'package:the_movie_app_padc/data/models/movie_booking_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:the_movie_app_padc/data/vos/credit_vo.dart';
import 'dart:async';

import 'package:the_movie_app_padc/data/vos/movie_vo.dart';

class MovieDetailsBloc extends ChangeNotifier{

  /// Model
  final MovieBookingModel _model = MovieBookingModel();

  /// State
  MovieVO? movieDetails;
  List<CreditVO>? creditList;

  /// Stream Subscription
  StreamSubscription? _movieDetailsStreamSubscription;

  MovieDetailsBloc(String movieId){
    /// Get Movie Details From Database
    _movieDetailsStreamSubscription = _model.getMovieDetailsFromDatabase(movieId).listen((movieDetailsDB) {
      movieDetails = movieDetailsDB;
      notifyListeners();
    });

    /// Get Movie Details From Network
    _model.getMovieDetails(movieId).then((_) {});

    _model.getCreditsByMovie(movieId).then((credits) {
      creditList = credits;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _movieDetailsStreamSubscription?.cancel();
    super.dispose();
  }
}