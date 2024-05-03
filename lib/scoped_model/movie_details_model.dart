import 'dart:async';

import 'package:scoped_model/scoped_model.dart';
import 'package:the_movie_app_padc/data/models/movie_booking_model.dart';
import 'package:the_movie_app_padc/data/vos/credit_vo.dart';

import '../data/vos/movie_vo.dart';

class MovieDetailsModel extends Model{
  /// Model
  final MovieBookingModel _model = MovieBookingModel();

  /// State
  MovieVO? movieDetails;
  List<CreditVO>? creditList;

  /// Stream subscription
  StreamSubscription? _movieDetailsStreamSubscription;

  MovieDetailsModel(String movieId){
    /// Get Movie Details From Database
    _movieDetailsStreamSubscription = _model.getMovieDetailsFromDatabase(movieId).listen((movieDetailsFromDatabase) {
      movieDetails = movieDetailsFromDatabase;
      notifyListeners();
    });

    /// Get Movie Details From Network
    _model.getMovieDetails(movieId.toString()).then((_) {});

    _model.getCreditsByMovie(movieId.toString()).then((credits) {
      creditList = credits;
      notifyListeners();
    });
  }

  void onDispose(){
    _movieDetailsStreamSubscription?.cancel();
  }

}