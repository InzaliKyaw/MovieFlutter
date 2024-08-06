import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:integration_test/integration_test.dart';
import 'package:the_movie_app_padc/data/vos/collection_vo.dart';
import 'package:the_movie_app_padc/data/vos/genre_vo.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/data/vos/otp_vo.dart';
import 'package:the_movie_app_padc/data/vos/production_company_vo.dart';
import 'package:the_movie_app_padc/data/vos/production_country_vo.dart';
import 'package:the_movie_app_padc/data/vos/spoken_language_vo.dart';
import 'package:the_movie_app_padc/main.dart';
import 'package:the_movie_app_padc/utils/strings.dart';
import 'package:the_movie_app_padc/utils/widget_keys.dart';
import 'package:flutter/material.dart';

/// Data waiting time atwt async lote pay ya mal
void main() async{
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  await initializeData();

  Future.delayed(const Duration(seconds: 3));

  testWidgets("", (tester) async{
    await tester.pumpWidget(const MovieBookingApp());
    await tester.pumpAndSettle(const Duration(seconds: 8));
    /// Home Screen
    expect(find.byKey(const Key(kBannerKey)), findsOneWidget);
    expect(find.byKey(const Key(kNowShowingOrComingSoonTabBarKey)), findsOneWidget);
    await tester.dragUntilVisible(
      find.byKey(const Key(kHomePageMovieNameKey)),
      find.byKey(const Key(kHomeKeyScroll)),
      const Offset(0, -20),
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const Key(kHomePageMovieNameKey)), findsOneWidget);

    /// Tap into movie detail screen
    await tester.tap(find.byKey(const Key(kHomePageMovieNameKey)));
    await tester.pumpAndSettle(const Duration(seconds: 3));
    expect(find.byKey(const Key(kMovieDetailsTopSectionKey)), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 3));
  });
}

Future initializeData() async{
  await Hive.initFlutter();
  Hive.registerAdapter(CollectionVOAdapter());
  Hive.registerAdapter(GenreVOAdapter());
  Hive.registerAdapter(MovieVOAdapter());
  Hive.registerAdapter(ProductionCompanyVOAdapter());
  Hive.registerAdapter(ProductionCountryVOAdapter());
  Hive.registerAdapter(SpokenLanguageVOAdapter());
  Hive.registerAdapter(OTPVOAdapter());
  await Hive.openBox<MovieVO>("kBoxNameMovieVO");
}