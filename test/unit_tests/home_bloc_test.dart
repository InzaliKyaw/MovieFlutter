import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_app_padc/blocs/home_bloc.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

import '../mock_components/mock_movie_booking_model.dart';
import '../mock_data/mock_data.dart';

void main(){
  group('HomeBloc Test', (){
    late HomeBloc homeBloc;
    late MockMovieBookingModel mockMovieBookingModel;

    setUp((){
      mockMovieBookingModel = MockMovieBookingModel();
      homeBloc = HomeBloc(model: mockMovieBookingModel);
    });

    /*
    /// Home Bloc yae constructor ko test lote tal
    test('Initial State', (){
      expect(homeBloc.selectedText, kNowShowingLabel);
      expect(homeBloc.nowPlayingMovies, mockNowPlayingMovieList);
      expect(homeBloc.comingSoonMovies, mockComingSoonMovieList);
      expect(homeBloc.moviesToShow, mockNowPlayingMovieList);
    });
     */


    /// OnTapNowShowingOrComingSoon State
    test('Switch to Coming Soon Movies', () async{
      homeBloc.onTapNowShowingOrComingSoon(kComingSoonLabel);
      expect(homeBloc.selectedText, kComingSoonLabel);
      expect(homeBloc.moviesToShow, mockComingSoonMovieList);
    });


  });
}