import 'package:the_movie_app_padc/data/vos/city_vo.dart';
import 'package:the_movie_app_padc/data/vos/credit_vo.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/network/data_agent/movie_booking_data_agent.dart';
import 'package:the_movie_app_padc/network/data_agent/retrofit_data_agent_impl.dart';
import 'package:the_movie_app_padc/network/response/get_otp_response.dart';
import 'package:the_movie_app_padc/persistance/daos/movie_dao.dart';
import 'package:the_movie_app_padc/persistance/movie_booking_database.dart';
import 'package:rxdart/rxdart.dart';

class MovieBookingModel {
static MovieBookingModel? _singleton;

factory MovieBookingModel() {
  _singleton ??= MovieBookingModel._internal();
  return _singleton!;
}

MovieBookingModel._internal();



/// Dao
// final MovieDao _movieDao = MovieDao();

/// Data Agent
/// PolyMorphism Can use different Impl
TheMovieBookingDataAgent mDataAgent = RetrofitDataAgentImpl();


Future getNowPlayingMovies() {
  return mDataAgent.getNowPlayingMovie(1.toString()).then((nowPlayingMovieList) async {
     var database = await MovieBookingDatabase.getMovieBookingDatabase;
    for(var movie in nowPlayingMovieList){
      movie.type = kMovieTypeNowPlaying;
    }
     database.movieDao.insertMovieList(nowPlayingMovieList);
  });
}

/// Coming Soon Movies
Future getComingSoonMovies(){
  return mDataAgent.getComingSoonMovies(1.toString()).then((comingSoonMovieList) async {
    var database = await MovieBookingDatabase.getMovieBookingDatabase;
    for(var movie in comingSoonMovieList){
      movie.type = kMovieTypeComingSoon;
    }
    database.movieDao.insertMovieList(comingSoonMovieList);
  });
}


Future getMovieDetails(String movieId){
  return mDataAgent.getMovieDetails(movieId).then((movie) async {
    var database = await MovieBookingDatabase.getMovieBookingDatabase;
    MovieVO? movieInDatabase = await database.movieDao.getMovieById(int.parse(movieId)).first;
    movie.type = movieInDatabase?.type ?? "";
    database.movieDao.insertMovie(movie);

  });
}


Future<GetOTPResponse> getOTP(String phNumber){
  // return mDataAgent.getOTP(phNumber).then((OTPVO) async {
  //   return OTPVO;
  // });
  return mDataAgent.getOTP(phNumber);
}

Future<GetOTPResponse> getCheckOTP(String phNumber, String otp){
  return mDataAgent.getCheckOTP(phNumber, otp);
}

Future<List<CityVO>> getCitiesFromNetwork(){
  return mDataAgent.getCities();
}



 ///Floor
/// Get Now Playing Movie From Database
Stream<List<MovieVO>> getNowPlayingMoviesFromDatabase() {
  return MovieBookingDatabase.getMovieBookingDatabase
    .asStream()
    .flatMap((database) => database.movieDao.getMovieByType(kMovieTypeNowPlaying));
}

/// Get Coming Soon Movie From Database
Stream<List<MovieVO>> getComingSoonMoviesFromDatabase()  {
  return MovieBookingDatabase.getMovieBookingDatabase
      .asStream()
    .flatMap((database) => database.movieDao.getMovieByType(kMovieTypeComingSoon));
}

/// Get Movie By Id from Database
Stream<MovieVO?> getMovieByIdFromDatabase(int movieId) {
  return MovieBookingDatabase.getMovieBookingDatabase
    .asStream()
    .flatMap((database) => database.movieDao.getMovieById(movieId));
}

Future<List<CreditVO>> getCreditsByMovie(String movieId) {
  return mDataAgent.getCreditsByMovie(movieId);
}

}

