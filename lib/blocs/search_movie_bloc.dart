import 'dart:async';
import 'package:the_movie_app_padc/data/models/movie_booking_model.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:rxdart/rxdart.dart';

class SearchMovieBloc{

  /// Movie Model
  final MovieBookingModel _model = MovieBookingModel();

  /// Stream Controller
  /// widget to Bloc
  StreamController<String> queryStreamController = StreamController();
  /// Bloc to Widget
  StreamController<List<MovieVO>> movieStreamController = StreamController();

  SearchMovieBloc(){
    // onChange time mhr subscribe ko khaw
    // debounce nae text pyi mhr network call khaw
    queryStreamController.stream
   .debounceTime(const Duration(milliseconds: 500))
    .listen((query){
      if(query.isNotEmpty){
        _makeSearchMovieNetworkCall(query);
      }
    });
  }

  void _makeSearchMovieNetworkCall(String query){
    _model.getSearchCinema(query).then((searchResults) {
      movieStreamController.sink.add(searchResults);
    }).catchError((error){
      movieStreamController.addError(error);
    });
  }

  /// Both Stream listener and data input widget stream have to dispose
  void onDispose(){
    queryStreamController.close();
    movieStreamController.close();
  }

}