import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/components/grid_time_slot_cinema.dart';
import 'package:the_movie_app_padc/pages/cinema_details_page.dart';
import 'package:the_movie_app_padc/pages/search_cinema_page.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

class CinemasPage extends StatefulWidget {
  const CinemasPage({super.key});

  @override
  State<CinemasPage> createState() => _CinemasPageState();
}

class _CinemasPageState extends State<CinemasPage> {
  bool isCinemaVisible = false;

  void cinemaTimeSlotVisibility(){
    setState((){
      if(isCinemaVisible == false){
        isCinemaVisible = true;
      }else{
        isCinemaVisible = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      /// App Bar with Search, Noti and Scan Icons
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: kBackgroundColor,
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchCinemaPage()));
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
      body: CustomScrollView(
            /// Cinema List
          slivers: [
            SliverList(delegate: SliverChildBuilderDelegate((context,index){
              return  GestureDetector(
                onTap: (){
                  cinemaTimeSlotVisibility();
                },
                child: Container(
                  child: Column(children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 14.0,right: 14.0,top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            kJunctionCity,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 16),
                          ),
                          Text(
                            kSeeDetails,
                            style: TextStyle(
                                color: kPrimaryColor,
                                decoration: TextDecoration.underline,
                                decorationColor: kPrimaryColor,
                                fontWeight: FontWeight.normal,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Wrap(
                      alignment: WrapAlignment.start,
                      direction: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    child: Image.asset(kParkingIcon, height: 16,width: 16,),
                                  ),
                                  const Text(kParking, style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16
                                  ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    child: Image.asset(kOnlineFoodIcon, height: 16,width: 16,),
                                  ),
                                  const Text(kOnlineFood, style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16
                                  ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    child: Image.asset(kWheelChairIcon, height: 16,width: 16,),
                                  ),
                                  const Text(kWheelChair, style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16
                                  ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isCinemaVisible,
                      child: Container(
                        height: 300,
                        child: GridTimeSlotCinema(onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const CinemaDetailPage()));
                        },),
                      ),
                    ),
                    new Divider(color: Colors.grey,)
                  ]),
                ),
              );
            },childCount: 6), )
          ]

        ),
      );
  }
}
