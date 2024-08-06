import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_app_padc/data/models/movie_booking_model.dart';
import 'package:the_movie_app_padc/data/models/movie_booking_model_impl.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/persistance/daos/movie_dao_impl.dart';
import '../mock_components/mock_movie_dao.dart';
import '../mock_components/mock_movie_data_agent.dart';
import '../mock_data/mock_data.dart';

void main() {
  group("MovieBookingModel Test", () {
    MovieBookingModelImpl movieBookingModel = MovieBookingModelImpl();

    setUp(() {
      movieBookingModel.setDaoAndDataAgents(
          MockMovieDao(), MockMovieDataAgent());
    });

    test('searchMovies returns list of movies', () async {
      /// Action
      final result = await movieBookingModel.getSearchCinema('query');

      /// Assertion
      /*
       * @param 1st_param  The value that is being tested.
       * @param 2nd_param  The expected value to compare against.
       */

      expect(result, mockNowPlayingMovieList);
    });


    test(
        "getNowPlayingMovies saves now playing movies with correct type", () async {
      /// Action
      await movieBookingModel.getNowPlayingMovies(1);

      /// Assertion
      final nowPlayingMoviesStream = movieBookingModel.getNowPlayingMoviesFromDatabase();
      nowPlayingMoviesStream.listen(expectAsync1((nowPlayingMovies) {
        expect(nowPlayingMovies, isNotEmpty);
        // expect(nowPlayingMovies[0].type, kMovieTypeNowPlaying);
      }));
    });

    test(
        "getComingSoonMovies saves now playing movies with correct type", () async {
      /// Action
      await movieBookingModel.getComingSoonMovies();

      /// Assertion
      final comingSoonMoviesStream = movieBookingModel.getComingSoonMoviesFromDatabase();
      comingSoonMoviesStream.listen(expectAsync1((comingSoonMovies) {
        expect(comingSoonMovies, isNotEmpty);
        // expect(nowPlayingMovies[0].type, kMovieTypeNowPlaying);
      }));
    });


    test('getMovieDetails save Movie details and return movie', () async {
      /// Action
      await movieBookingModel.getNowPlayingMovies(1);

      /// Assertion
      /*
       * @param 1st_param  The value that is being tested.
       * @param 2nd_param  The expected value to compare against.
       */
      var result = await movieBookingModel.getMovieDetails("1");
      expect(result, mockMovie);
    });

    test('getCreditsByMovie save Movie details and return movie', () async {
      /// Action
      await movieBookingModel.getNowPlayingMovies(1);

      /// Assertion
      /*
       * @param 1st_param  The value that is being tested.
       * @param 2nd_param  The expected value to compare against.
       */
      var result = await movieBookingModel.getCreditsByMovie("1");
      expect(result, mockCreditList);
    });
  }
  );
}