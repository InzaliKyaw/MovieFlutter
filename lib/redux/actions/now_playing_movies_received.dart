import 'package:the_movie_app_padc/data/vos/movie_vo.dart';

// Widget ko Reduxer ka lote
class NowPlayingMoviesReceived{
  List<MovieVO> movies;

  NowPlayingMoviesReceived(this.movies);
}