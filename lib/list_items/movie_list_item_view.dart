import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';

class MovieListItemView extends StatelessWidget {
  final bool isComingSoonSelected;
  final MovieVO? movieVO;

   const MovieListItemView({
     super.key,
     this.isComingSoonSelected = false,
     required this.movieVO});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(kMarginMedium),
      ),
      child: Column(
        children:[
          /// Movie Image and Gradient
          Stack(
            children: [
              /// Movie Image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(kMarginMedium),
                    topRight: Radius.circular(kMarginMedium),
                ),
                child: Image.network(
                  movieVO?.getBackdropPathWithBaseUrl() ?? "",
                  fit: BoxFit.cover,
                  height:kMovieListItemImageHeight,
                  width: double.infinity,
                ),
              ),

              /// Gradient
              Container(
                height: kMovieListItemImageHeight,
                decoration:const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.transparent, Colors.black],
                      stops: [0.0, 0.6, 1.0]),
                ),

              ),

              /// Indicator
              Align(
                alignment: Alignment.topRight,
                child: Visibility(
                  visible: isComingSoonSelected,
                  child: Padding(
                    padding: const EdgeInsets.only(top: kMarginMedium, right: kMarginMedium),
                    child: Padding(
                      padding: const EdgeInsets.only(top: kMarginMedium,right: kMarginMedium),
                      child: Container(
                        width: kMarginXLarge,
                        height: kMarginXLarge,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(kMarginMedium)
                        ),
                        child: const Center(
                          child: Text(
                              "8th\nAUG",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color:  kNowPlayingAndComingSoonSelectedTextColor,
                            fontSize: kTextSmall
                          ),),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),

          /// Movie Name and IMDB
           MovieNameAndIMDBView(movieVO: movieVO,),

          const SizedBox(height: 10,),

          /// Additional Info View
          const AdditionalInfoView()
        ]


      ),
    );
  }
}

class MovieNameAndIMDBView extends StatelessWidget {
  final MovieVO? movieVO;

  const MovieNameAndIMDBView({super.key, required this.movieVO});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: kMarginMedium),
    child: Row(
      children: [

        /// Name
         SizedBox(
           width: 100,
           child: Text(
             key: Key(movieVO?.title ?? ""),
             movieVO?.title ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: kTextSmall
            ),
                   ),
         ),

        /// Spacer

        /// IMDb
        Image.asset( "assets/images/imdb_logo.png",
        width: kMarginXLarge,
        height: kMarginMedium3,),

        /// Rating
         Text(
          movieVO!.getRatingTwoDecimal(),
          style: const TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: kTextSmall,
            fontWeight: FontWeight.w700
          ),
        )
      ],
    ),);
  }
}

class AdditionalInfoView extends StatelessWidget {
  const AdditionalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: EdgeInsets.symmetric(horizontal: kMarginMedium ),
    child: Row(
      children: [
        /// Restriction
        const Text("U/A",
        style: TextStyle(
          color: Colors.white,
          fontSize: kTextSmall,
          fontWeight: FontWeight.w600
        ),
        ),
        /// Spacer
        const SizedBox(width: kMarginMedium,),

        /// Circle
         Container(
          width: kMargin5,
          height: kMargin5,
          decoration: const BoxDecoration(
            color: kCircleColor,
            shape: BoxShape.circle
          ),
        ),

        /// Spacer
        const SizedBox(
          width: kMarginMedium,
        ),
        
        /// Types
        const Text(
            "20, 30, 30 IMAX",
        style: TextStyle(
          color: Colors.white,
          fontSize: kTextSmall,
        ),)
      ],
    ),);
  }
}

