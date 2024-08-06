import 'package:the_movie_app_padc/data/models/movie_booking_model.dart';
import 'package:the_movie_app_padc/data/vos/city_vo.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/network/response/get_cinema_timeslot_response.dart';
import 'package:the_movie_app_padc/network/response/get_otp_response.dart';
import 'package:the_movie_app_padc/persistance/daos/movie_dao_d.dart';
import 'package:the_movie_app_padc/persistance/daos/movie_dao.dart';

import '../../network/data_agent/movie_booking_data_agent.dart';
import '../../network/data_agent/retrofit_data_agent_impl.dart';
import '../../persistance/daos/movie_dao_impl.dart';
import '../../persistance/daos/otp_dao.dart';
import '../vos/credit_vo.dart';

class MovieBookingModelImpl extends MovieBookingModel{
  static MovieBookingModelImpl? _singleton;

  factory MovieBookingModelImpl() {
    _singleton ??= MovieBookingModelImpl._internal();
    return _singleton!;
  }

  MovieBookingModelImpl._internal();

  /// Dao
  // MovieDao _movieDao = MovieDao();
  final OTPDao _otpDao = OTPDao();

  /// Data Agent
  /// PolyMorphism Can use different Impl
  TheMovieBookingDataAgent mDataAgent = RetrofitDataAgentImpl();
  /// Strategy Pattern
  MovieDao _movieDao = MovieDaoImpl();


  void setDaoAndDataAgents(MovieDao dao, TheMovieBookingDataAgent dataAgent){
    _movieDao = dao;
    mDataAgent = dataAgent;
  }

  Future<List<MovieVO>> getNowPlayingMovies(int page) {
    return mDataAgent.getNowPlayingMovie(page.toString()).then((nowPlayingMovieList) async {
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

  /// Similar Movies
  Future<List<MovieVO>> getSimilarMovies(int movieId){
    return mDataAgent.getSimilarMovies(movieId);
  }

  Future<MovieVO> getMovieDetails(String movieId){
    return mDataAgent.getMovieDetails(movieId).then((movie) async {
      // Sync type before saving
      MovieVO? movieFromDatabase = _movieDao.getMovieById(int.parse(movieId));
      if(movieFromDatabase != null){
        movie.type = movieFromDatabase.type ?? "";
      }
      _movieDao.saveSingleMovie(movie);
      return movie;
    });
  }

  Future<GetOTPResponse> getOTP(String phNumber){
    // return mDataAgent.getOTP(phNumber).then((OTPVO) async {
    //   return OTPVO;
    // });
    return mDataAgent.getOTP(phNumber);
  }

  Future<GetOTPResponse> getCheckOTP(String phNumber, String otp){
    return mDataAgent.getCheckOTP(phNumber, otp).then((GetOTPResponse){
      _otpDao.saveOTPResponeVO(GetOTPResponse);
      return GetOTPResponse;
    });

  }

  Stream<List<MovieVO>> getNowPlayingMoviesFromDatabase(){
    return _movieDao.watchMovieBox().map((_) => _movieDao.getMoviesByType(kMovieTypeNowPlaying));
  }

  Stream<List<MovieVO>> getComingSoonMoviesFromDatabase(){
    return _movieDao.watchMovieBox().map((_) => _movieDao.getMoviesByType(kMovieTypeComingSoon));
  }

  Stream<MovieVO?> getMovieDetailsFromDatabase(String movieId){
    return _movieDao.watchMovieBox().map((_) => _movieDao.getMovieById(int.parse(movieId)));
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

  Future<List<MovieVO>> getSearchCinema(String query){
    return mDataAgent.getSearchMovie(query);
  }
}