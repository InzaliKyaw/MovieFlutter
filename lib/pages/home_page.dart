import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_movie_app_padc/blocs/home_bloc.dart';
import 'package:the_movie_app_padc/components/best_popular_movies_and_series_section_view.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/list_items/movie_list_item_view.dart';
import 'package:the_movie_app_padc/pages/movie_details_page.dart';
import 'package:the_movie_app_padc/pages/search_movie_page.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/utils/strings.dart';
import 'package:the_movie_app_padc/utils/widget_keys.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        /// AppBar
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: kBackgroundColor,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // const SizedBox(
              //   width: kMarginMedium2,
              // ),
               Align(
                 alignment: Alignment.topLeft,
                 child: Image.asset(
                  kLocationArrowIcon,
                  width: kLocationIconSize,
                             ),
               ),
              const Text(
                  "Yangon",
                  style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontWeight: FontWeight.w700, fontSize: kTextRegular2x),
              ),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchMoviePage()));
              },
              child: const Icon(
                Icons.search,
                color: Colors.white,
                size: kMarginLarge,
              ),
            ),
            const SizedBox(
              width: kMarginLarge,
            ),
            const Icon(
              Icons.notifications,
              color: Colors.white,
              size: kMarginLarge,
            ),
            const SizedBox(
              width: kMarginMedium3,
            ),
            Image.asset(
              kScanIcon,
              width: kMarginLarge,
              height: kMarginLarge,
            ),
            const SizedBox(
              width: kMarginLarge,
            ),
          ],
        ),
        body: const HomeScreenBodyView(),
      ),
    );
  }
}

class HomeScreenBodyView extends StatelessWidget {
  const HomeScreenBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: const Key(kHomeKeyScroll),
      slivers: [
        /// Banner
        SliverToBoxAdapter(
          child: BannerSectionView(
            key: const Key(kBannerKey),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: kMargin30,),
        ),
         /// Best Popular Movie
        /*
          SliverToBoxAdapter(
          child: Selector<HomeBloc, List<MovieVO>?>(
              selector: (context, bloc) => bloc.nowPlayingMovies,
              builder: (context, nowPlayingMovieList, child) =>
                  BestPopularMoviesAndSerialsSectionView(title: kBESTPOPULAR, mNowPlayingMovieList: nowPlayingMovieList,
                  onListEndReached: (){
                    var bloc = Provider.of<HomeBloc>(context, listen: false);
                    bloc.onNowPlayingMovieListEndReached();
                  },)),
        ),
         */
        /// Now Playing and coming Soon Tab Bar
        SliverToBoxAdapter(
          /// Reactive phit ag loc
          child: Selector<HomeBloc, String>(
            selector: (context, bloc ) => bloc.selectedText,
            /// second param ka => thu monitor nay tae data
            builder: (context, selectedText, child) => NowShowingComingSoonTabBar(
              key: const Key(kNowShowingOrComingSoonTabBarKey),
              selectedText: selectedText,
              onTapNowShowingOrComingSoon: (text){
                var bloc = context.read<HomeBloc>();
                bloc.onTapNowShowingOrComingSoon(text);
              },
            ),
          ),
        ),

        /// Spacer
        const SliverToBoxAdapter(
          child: SizedBox(
            height: kMargin30,),
        ),

        /// Movie List Grid View
        Selector<HomeBloc, List<MovieVO>>(
          selector: (context, bloc) => bloc.moviesToShow ,
          builder: ( context, moviesToShow ,model) {
            var bloc = context.read<HomeBloc>();
            return (moviesToShow.isEmpty) ?
            const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              ),
            ): SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
              sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                        (context, index){
                      return GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetailsPage(
                              movieId: moviesToShow[index].id?.toString() ?? "",
                            ),
                               ));
                          },
                          child: MovieListItemView(
                            isComingSoonSelected: bloc.selectedText == kComingSoonLabel,
                            movieVO: moviesToShow[index],));
                    },
                    childCount: moviesToShow.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: kMovieListItemHeight,
                      mainAxisSpacing: kMarginMedium2,
                      crossAxisSpacing: kMarginMedium2)
              ),
            );
          },
        ),
      ],
    );
  }
}

class BannerSectionView extends StatelessWidget {
   BannerSectionView({super.key});

  final PageController _bannerPageController = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Banner Page View
        SizedBox(
          height: kBannerHeight,
          child: PageView.builder(
            controller: _bannerPageController,
            itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kMarginMedium),
                child: Image.asset(
                  kBannerImage,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
            itemCount: 5,
        ),
        ),

        /// Spacer
        const SizedBox(height: kMarginMedium2),

        /// Dots Indicator
        SmoothPageIndicator(
            controller: _bannerPageController,
            count: 5,
            effect:
            const SlideEffect(
              dotColor: kInactiveDotsColor,
              activeDotColor: kPrimaryColor,
              dotHeight: kMarginMedium,
              dotWidth: kMarginMedium
            ),
           onDotClicked:(index){
              _bannerPageController.animateToPage(index, duration: const Duration(milliseconds: 500),curve: Curves.easeOut);
           },
        )
      ],
    );
  }
}

class NowShowingComingSoonTabBar extends StatelessWidget {

  final String selectedText;
  final Function(String) onTapNowShowingOrComingSoon;

  const NowShowingComingSoonTabBar({super.key, required this.selectedText, required this.onTapNowShowingOrComingSoon}) ;

  Widget build(BuildContext context) {
    return Container(
      height: kNowPlayingAndComingSoonTabBarHeight,
      margin: const EdgeInsets.symmetric(horizontal: kMarginLarge),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const RadialGradient(colors:
          [
            kNowPlayingAndComingSoonGradientStartColor,kNowPlayingAndComingSoontradientEndColor
          ],
            radius: 7.5,
            center: Alignment(0, -0.02),
          )
      ),
      child: Row(
        children: [
          /// Now Showing Button
          Expanded(child: NowShowingOrComingSoonButtonView(
            label: kNowShowingLabel,
            isSelected: selectedText == kNowShowingLabel,
            onTapButton: (){
              onTapNowShowingOrComingSoon(kNowShowingLabel);
            },
          ),
          ),

          /// Coming Soon Button
          Expanded(child: NowShowingOrComingSoonButtonView(
            label: kComingSoonLabel,
            isSelected: selectedText == kComingSoonLabel,
            onTapButton: (){
              onTapNowShowingOrComingSoon(kComingSoonLabel);
            },
          ),
          )
        ],
      ),
    );
  }

}

class NowShowingOrComingSoonButtonView extends StatelessWidget {

  final bool isSelected;
  final String label;
  final Function onTapButton;

  const NowShowingOrComingSoonButtonView({super.key,required this.isSelected, required this.label, required this.onTapButton});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTapButton();
      },
      child: Container(
        margin: const EdgeInsets.all(kMarginMedium),
        decoration: BoxDecoration(
          color: (isSelected)? kPrimaryColor: null,
          borderRadius: BorderRadius.circular(kMarginSmall)
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: (isSelected) ? kNowPlayingAndComingSoonSelectedTextColor : kNowPlayingAndComingSoonSelectedTextColor,
              fontSize: kTextRegular2x,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
    );
  }
}

