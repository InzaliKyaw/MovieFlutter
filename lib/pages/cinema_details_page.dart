import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/utils/spaces.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

class CinemaDetailPage extends StatefulWidget {
  const CinemaDetailPage({Key? key}) : super(key: key);

  @override
  State<CinemaDetailPage> createState() => _CinemaDetailPageState();
}

class _CinemaDetailPageState extends State<CinemaDetailPage> {
  final List<String> safetyList = [
    "Thermal Scanning",
    "Contactless Security Check",
    "Sanitization Before Every Show",
    "Disposable 3D glass",
    "Contactless Food Service",
    "Package Food",
    "Deep Cleaning of rest room"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// App Bar
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kMarginLarge, vertical: kMarginMedium),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: kMarginLarge,
                      ),
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          kCinemaDetails,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Image.asset(kStar,
                    height: 18,
                    width: 18,)
                  ],
                ),
              ),
              /// Movie Large Image Session
              const MovieLargeImageSmallImageAndInfoView(),
              verticalSpacing(14),
              /// Movie Body
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Cinema Name and Map
                    const Text(
                      kCinemaName,
                      style: TextStyle(
                          fontSize: kTextRegular,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    verticalSpacing(8),
                    Row(
                      children: [
                        const Text(
                          kCinemaPlace,
                          style: TextStyle(
                              fontSize: kTextRegular2x,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            kLocationArrowIcon,
                            width: 24,
                            height: 24,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    verticalSpacing(48),

                    /// Facility Session
                    const Text(
                      kFacility,
                      style: TextStyle(
                          fontSize: kTextRegular2x,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    verticalSpacing(14),
                    Wrap(
                      spacing: kMarginMedium,
                      runSpacing: kMarginMedium,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Image.asset(kParkingIcon,
                                  height: 16, width: 16, color: kPrimaryColor),
                            ),
                            const Text(
                              kParking,
                              style:
                              TextStyle(color: kPrimaryColor, fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Image.asset(
                                kOnlineFoodIcon,
                                height: 16,
                                width: 16,
                                color: kPrimaryColor,
                              ),
                            ),
                            const Text(
                              kOnlineFood,
                              style:
                              TextStyle(color: kPrimaryColor, fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Image.asset(kWheelChairIcon,
                                  height: 16, width: 16, color: kPrimaryColor),
                            ),
                            const Text(
                              kWheelChair,
                              style:
                              TextStyle(color: kPrimaryColor, fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Image.asset(
                                kTicketCancel,
                                height: 16,
                                width: 16,
                                color: kPrimaryColor,
                              ),
                            ),
                            const Text(
                              kTicketCancellation,
                              style:
                              TextStyle(color: kPrimaryColor, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    verticalSpacing(24),

                    /// Safety Chips
                    const Text(
                      kSafety,
                      style: TextStyle(
                          fontSize: kTextRegular2x,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    verticalSpacing(14),
                    Wrap(
                      spacing: kMarginMedium,
                      runSpacing: kMarginMedium,
                      children: safetyList
                          .map(
                            (genre) => Container(
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius:
                            BorderRadius.circular(kMarginMedium2),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: kMarginMedium,
                              vertical: kMarginSmall),
                          child: Text(
                            genre,
                            style: const TextStyle(
                                color: Colors.black, fontSize: kTextSmall),
                          ),
                        ),
                      )
                          .toList(),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

class MovieLargeImageSmallImageAndInfoView extends StatelessWidget {
  const MovieLargeImageSmallImageAndInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: kMovieDetailsTopImageHeight,
        child: Stack(
          children: [
            /// Large Image and Info
            Image.network(
              "https://cdn.oneesports.gg/cdn-data/2023/04/Anime_OnePiece_WanoCountryArc_Wallpaper-450x253.jpg",
              height: kMovieDetailsTopImageHeight,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.play_circle_fill_outlined,
                color: Colors.white,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
