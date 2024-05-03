import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:the_movie_app_padc/components/cinema_button_icon_custom.dart';
import 'package:the_movie_app_padc/components/ticket_button.dart';
import 'package:the_movie_app_padc/data/vos/credit_vo.dart';
import 'package:the_movie_app_padc/pages/time_slot_page.dart';
import 'package:the_movie_app_padc/scoped_model/movie_details_model.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/pages/cast_item_view.dart';
import 'package:the_movie_app_padc/utils/spaces.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

import '../data/vos/movie_vo.dart';

class MovieDetailsPage extends StatefulWidget {
  final String? movieId;


  /// Will receive from previous screen
  const MovieDetailsPage({super.key, required this.movieId});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {

  /// Model
  late MovieDetailsModel _model;

  /// State
  MovieVO? movieDetails;
  List<CreditVO>? creditList;

  late bool isComingSoon;
  late String data;

  /// Stream Subscription
  StreamSubscription? _movieDetailsStreamSubscription;

  @override
  void initState() {
    _model = MovieDetailsModel(widget.movieId ?? "0");
    super.initState();
  }

  @override
  void dispose() {
    _movieDetailsStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    data = (ModalRoute.of(context)?.settings.arguments as String?)!;
    setState(() {
      if(data == kComingSoonLabel){
        isComingSoon = true;
      }else{
        isComingSoon = false;
      }
    });
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ScopedModelDescendant<MovieDetailsModel>(
        builder: (BuildContext context, Widget? child, MovieDetailsModel model) =>
         SafeArea(
          child: (model.movieDetails == null)? const Center(
            child: CircularProgressIndicator(),
          ): Stack(
            children: [
              /// App Bar
              Padding(padding: const EdgeInsets.symmetric(horizontal: kMarginLarge, vertical: kMarginMedium),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: kMarginLarge,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.share,
                      color: Colors.white,
                      size: kMarginXLarge,
                    )
                  ],
                ),),
              /// Body
               SingleChildScrollView(
                child: Column(
                  children: [
                    /// Movie Large Image, Small Image and Info
                     MovieLargeImageSmallImageAndInfoView(movieVO: model.movieDetails),

                    /// Spacer
                    const SizedBox(
                      height: kMargin30,
                    ),

                    /// Censor Rating, Release Date and Duration
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kMarginMedium2),
                      child: Container(
                           height: 60,
                          child: CensorRatingReleaseDateAndDurationView(
                            movieVO: model.movieDetails,
                          )),
                    ),
                    verticalSpacing(14),
                    /// Release Card
                    Visibility(
                      visible: isComingSoon,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient:  const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    kNowPlayingAndComingSoonSelectedTextColor,
                                    kNowPlayingAndComingSoontradientEndColor
                                  ])),

                          child: Row(
                                children: [
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0,top: 24),
                                        child: Text(kReleaseStr,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: kTextRegular2x,
                                              fontWeight: FontWeight.w700
                                          ),),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          kReleaseDescription,
                                          style: TextStyle(
                                              color: kGreyC8,
                                              fontSize: kTextRegular,
                                              fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(14.0,),
                                        child: CinemaButtonIconCustom(
                                            img: kNotification2Icon,
                                            label: kSetNotification,
                                            bgColor: kPrimaryColor,
                                            imgHeight: 24, imgWidth: 24,
                                            txtColor: Colors.black, radius: 5),
                                      )
                                    ],
                                  ),
                                  Expanded(
                                    child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(kReleaseImg,
                                          height: 200,),
                                        )),
                                  )
                                ],
                              )
                        ),
                      ),
                    ),
                    /// Spacer
                    const SizedBox(height: kMargin30,),

                    /// Story Line View
                     Padding(padding: const EdgeInsets.symmetric(horizontal: kMarginMedium2),
                    child: StoryLine(movieVO: model.movieDetails,),),

                    ///
                    Visibility(
                      visible: !(creditList?.isEmpty ?? true),
                      child: CastView(
                        creditList: creditList ?? []
                      ),
                    )
                  ],
                ),
              ),


              /// Bottom Gradient and Booking Button
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: kMovieDetailsBottomContainerHeight,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, kBackgroundColor]
                    )
                  ),
                  child: Center(
                    child: TicketButton(btnText: kBookingLabel, btnColor: kPrimaryColor, txtColor: Colors.black, onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> TimeSlotPage()));
                    }),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class StoryLine extends StatelessWidget {
  final MovieVO? movieVO;

  const StoryLine({
    super.key,required this.movieVO,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
            "Story Line",
          style: TextStyle(
            color: Colors.white,
            fontSize: kTextRegular,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: kMarginMedium,),
        Text(
          movieVO?.overview ?? "",
          style: const TextStyle(
            color: Colors.white,
            fontSize: kTextRegular,
            fontWeight: FontWeight.w500,
          ),
        ),

      ],
    );
  }
}

class CensorRatingReleaseDateAndDurationView extends StatelessWidget {
  final MovieVO? movieVO;

  const CensorRatingReleaseDateAndDurationView({super.key, this.movieVO});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          const CensorRatingReleaseDateAndItemView(
            label: "Censor Rating",
            value: "U/A",
          ),
        CensorRatingReleaseDateAndItemView(
          label: "Release Date",
          value: movieVO?.getRunTimeFormatted() ?? "",
        ),
        CensorRatingReleaseDateAndItemView(
          label: "Duration",
          value:  movieVO?.getRunTimeFormatted() ?? "",
        ),
      ],
    );
  }
}

class CensorRatingReleaseDateAndItemView extends StatelessWidget {

  final String label;
  final String value;

  const CensorRatingReleaseDateAndItemView({
    super.key, required this.label, required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kMarginCardMedium2),
        gradient: const LinearGradient(colors: [
          kMovieDetailsCensorRatingGradientStartColor,
          kMovieDetailsCensorRatingGradientEndColor
        ])
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: kTextSmall
            ),
          ),
          const SizedBox(height: kMarginMedium,),
          Text(
            value,
             style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: kTextRegular),
              )
        ],
      ),
    );
  }
}

class MovieLargeImageSmallImageAndInfoView extends StatelessWidget {
  final MovieVO? movieVO;

  const MovieLargeImageSmallImageAndInfoView({super.key,
    required this.movieVO});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 391,
        child: Stack(
          children: [
            /// Large Image and Info
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.network(
                  movieVO?.getBackdropPathWithBaseUrl() != null ? movieVO!.getBackdropPathWithBaseUrl() : "" ,
                  height: kMovieDetailsTopImageHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,),
      
                  const SizedBox(height: kMarginMedium2,),
                  /// Movie Info
                   MovieInfoGenresView(movieVO: movieVO,),
                  /// Text
                ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.chevron_left,
                color: Colors.white,
                size: kMarginXLarge,
              ),
            ),
            /// Small Image
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: kMarginMedium2, bottom: kMarginMedium2),
                child: Image.network(
                 movieVO?.getPosterPathWithBaseUrl() ?? "",
                width: kMovieDetailsSmallImageWidth,
                height: kMovieDetailsSmallImageHeight,
                fit: BoxFit.cover,),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieInfoGenresView extends StatelessWidget {
  final MovieVO? movieVO;

  MovieInfoGenresView({
    super.key,
    required this.movieVO}) ;

  final List<String> genreList = ["Action","Adventure","Drama", "Animation"];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.57,
      child:  Padding(
        padding: const EdgeInsets.only(left: kMarginMedium2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           /// Movie Name and Rating
             MovieNameAndRatingView(movieVO: movieVO),

            const SizedBox(height: kMarginMedium2,),
            // /// Types
            const Text("20, 30, 30 IMAX, 30 OBOX",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: kTextRegular2x
            ),),

            const SizedBox(height: kMarginMedium2,),

            /// Genres
            Wrap(
              spacing: kMarginMedium,
              runSpacing: kMarginMedium,
              children: movieVO?.genres?.take(5)
                  .map((genre) => genre.name ?? "")
                  .map(
                      (genre) => Container(
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(kMarginMedium2),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: kMarginMedium, vertical: kMarginSmall),
                        child: Text(
                          genre,
                          style: const TextStyle(
                            color: Colors.black, fontSize: kTextSmall
                          ),
                        ),
                      ),
            ).toList() ?? [],)



          ],
        ),
      ),
    );
  }
}


class MovieNameAndRatingView extends StatelessWidget {
  final MovieVO? movieVO;

  const MovieNameAndRatingView({super.key, required this.movieVO});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Movie Name
         Text(
          movieVO?.title ?? "",
          maxLines: 2,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: kTextRegular2x
          ),
        ),
        const SizedBox(
          width: kMarginMedium,
        ),
        Image.asset(
          kImbImage,
          width: kIMDBWidth,
          height:kIMDBHeight,
        ),
         Text(
          movieVO?.getRatingTwoDecimal() ?? "",
          style: const TextStyle(
            color: Colors.white,
            fontSize: kTextRegular2x,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}

class CastView extends StatelessWidget {
  final List<CreditVO> creditList;

  const CastView({super.key,required this.creditList});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.symmetric(horizontal: kMarginMedium2),
            child: Text(
              "Cast",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: kTextRegular
              ),
            )
        ),

        /// Spacer
        const SizedBox(height: kMarginMedium3,),

        /// Cast
        SizedBox(
          height: kMarginXXLarge,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: kMarginMedium2),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
            return CastItemView(
              creditVO: creditList[index],
            );
          },
            itemCount: creditList.length,
          ),
        )
      ],
    );
  }
}
