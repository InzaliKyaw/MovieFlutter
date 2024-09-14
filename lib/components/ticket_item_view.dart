import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

class TicketItemView extends StatelessWidget {
  final Function() onTap;

  const TicketItemView({
    super.key,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.45,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [kMovieDetailsCensorRatingGradientEndColor,kNowPlayingAndComingSoonGradientStartColor]
            ),
            borderRadius: BorderRadius.circular(5)
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: kMarginSmall,
                          bottom: kMarginSmall),
                      child: Image.network(
                        "https://img.asmedia.epimg.net/resizer/XE_6XxkUhuWEtPjL7HEpGIjpg6s=/1200x1200/cloudfront-eu-central-1.images.arcpublishing.com/diarioas/U6LVWIVDSRE6HIB5GQQQ3LSAPE.jpg",
                        width: kTicketMovieWidth,
                        height: kTicketMovieHeight,
                        fit: BoxFit.cover,),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Movie Name
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Text(kMovieName,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),),
                              SizedBox(
                                width: 30,
                                child: Text(kCinemaType,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16
                                    )),
                              )
                            ],
                          ),
                        ),
                        /// Cinema Name
                        Padding(
                          padding: EdgeInsets.all( 8.0),
                          child: Row(
                            children: [
                              Text(kCinemaName,
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16
                                ),),
                            ],
                          ),
                        ),
                        /// SeatType
                        Padding(
                          padding: EdgeInsets.symmetric( horizontal: 8.0),
                          child: Row(
                            children: [
                              Text(kSeatType,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16
                                ),),
                              SizedBox(
                                width: 50,
                                child: Text(kSCREEN2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16
                                  ),),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
              /// Divider
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 14.0),
                child: Divider(height: 1,color:kNowPlayingAndComingSoontradientEndColor,),
              ),
              /// Date, Time, Place Icons
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    /// Date
                    SizedBox(height: 120,
                        child: Column(
                          children: [
                            Image.asset(
                              kDateIcon,height: 24, width: 24,
                              color: kPrimaryColor,
                            ),
                            const Text(
                              kDate,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14
                              ),
                            )
                          ],
                        )
                    ),
                    /// Time
                    Expanded(
                      child: SizedBox(
                          height: 120,
                          child: Column(
                            children: [
                              Image.asset(
                                kTimeIcon,height: 24, width: 24,
                                color: kPrimaryColor,
                              ),
                              const Text(
                                kTime,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14
                                ),
                              )
                            ],
                          )
                      ),
                    ),

                    /// Place
                    Container(
                        height: 120,
                        child: Column(
                          children: [
                            Image.asset(
                              kPlaceIcon,height: 24, width: 24,
                              color: kPrimaryColor,
                            ),
                            const Text(
                              kPlace,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14
                              ),
                            )
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
