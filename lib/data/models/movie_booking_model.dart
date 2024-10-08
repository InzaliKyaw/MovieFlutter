
import 'package:the_movie_app_padc/data/vos/city_vo.dart';
import 'package:the_movie_app_padc/data/vos/credit_vo.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/network/data_agent/movie_booking_data_agent.dart';
import 'package:the_movie_app_padc/network/data_agent/retrofit_data_agent_impl.dart';
import 'package:the_movie_app_padc/network/response/get_cinema_timeslot_response.dart';
import 'package:the_movie_app_padc/network/response/get_otp_response.dart';
import 'package:the_movie_app_padc/network/response/get_seat_response.dart';
import 'package:the_movie_app_padc/network/response/get_snack_response.dart';
import 'package:the_movie_app_padc/persistance/daos/movie_dao.dart';
import 'package:the_movie_app_padc/persistance/daos/otp_dao.dart';

class MovieBookingModel {
static MovieBookingModel? _singleton;

factory MovieBookingModel() {
  _singleton ??= MovieBookingModel._internal();
  return _singleton!;
}

MovieBookingModel._internal();

/// Dao
final MovieDao _movieDao = MovieDao();
final OTPDao _otpDao = OTPDao();

/// Data Agent
/// PolyMorphism Can use different Impl
TheMovieBookingDataAgent mDataAgent = RetrofitDataAgentImpl();

Future<List<MovieVO>> getNowPlayingMovies() {
  return mDataAgent.getNowPlayingMovie(1.toString()).then((nowPlayingMovieList) async {
    // var database = await MovieBookingDatabase.getMovieBookingDatabase;
    for(var movie in nowPlayingMovieList){
      movie.type = kMovieTypeNowPlaying;
    }
    // database.movieDao.insertMovieList(nowPlayingMovieList);
    _movieDao.saveMovies(nowPlayingMovieList);
    /// network ka ya tr ko return pyan
    return nowPlayingMovieList;
  });
}

/// Coming Soon Movies
Future<List<MovieVO>> getComingSoonMovies(){
  return mDataAgent.getComingSoonMovies(1.toString()).then((comingSoonMovieList) async {
    // var database = await MovieBookingDatabase.getMovieBookingDatabase;
    for(var movie in comingSoonMovieList){
      movie.type = kMovieTypeComingSoon;
    }
    // database.movieDao.insertMovieList(comingSoonMovieList);
    _movieDao.saveMovies(comingSoonMovieList);
    return comingSoonMovieList;
  });
}

Future<MovieVO> getMovieDetails(String movieId){
  return mDataAgent.getMovieDetails(movieId).then((movie) async {
    // var database = await MovieBookingDatabase.getMovieBookingDatabase;
    // database.movieDao.insertMovie(movie);
    _movieDao.saveSingleMovie(movie);
    return movie;
  });
}

Future<GetOTPResponse> getOTP(String phNumber){
  return mDataAgent.getOTP(phNumber);
}

Future<GetOTPResponse> getCheckOTP(String phNumber, String otp){
  return mDataAgent.getCheckOTP(phNumber, otp).then((GetOTPResponse){
    _otpDao.saveOTPResponeVO(GetOTPResponse);
    return GetOTPResponse;
  });

}

 List<MovieVO> getNowPlayingMoviesFromDatabase(){
   return _movieDao.getMovieByType(kMovieTypeNowPlaying);
 }

  List<MovieVO> getComingSoonMoviesFromDatabase(){
    return _movieDao.getMovieByType(kMovieTypeComingSoon);
  }

  MovieVO? getMovieDetailsFromDatabase(String movieId){
   return _movieDao.getMovieById(movieId);
  }

  Future<List<CreditVO>> getCreditsByMovie(String movieId){
   return mDataAgent.getCreditsByMovie(movieId);
  }

  // String? getTokenFromDatabase(String id){
  //
  // }

  Future<List<CityVO>> getCitiesFromNetwork(){
    return mDataAgent.getCities();
  }

  Future<GetCinemaDayTimeSlotResponse> getCinemaDayTime(String date, String token){
    return mDataAgent.getCinemaDayTimeSlot(date, token);
  }

  Future<GetSeatResponse> getSeatResponse(String date, int cinemaDayTimeslotId, String token){
   return mDataAgent.getSeatResponse(date, cinemaDayTimeslotId, token);
  }

  Future<GetSnackResponse> getSnackResponse(String token){
   return mDataAgent.getSnackResponse(token);
  }



}


