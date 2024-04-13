import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_movie_app_padc/components/availability_labels.dart';
import 'package:the_movie_app_padc/components/grid_time_slot_cinema.dart';
import 'package:the_movie_app_padc/pages/seat_plan_page.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/utils/spaces.dart';
import 'package:the_movie_app_padc/utils/strings.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';

class TimeSlotPage extends StatefulWidget {
  const TimeSlotPage({super.key});

  @override
  State<TimeSlotPage> createState() => _TimeSlotPageState();
}

class _TimeSlotPageState extends State<TimeSlotPage> {
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

  void getCinemaFromNetwork(){
  }


  @override
  void initState() {
    super.initState();
  }

  Future<int> getIdFromSharedPreference() async{
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    // get an integer value from 'num' key.
    int? id =  prefs.getInt('id');
    return id ?? 0;
  }

  Future<String> getTokenFromSharedPreference() async{
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    // get an integer value from 'num' key.
    String? token =  prefs.getString('token');
    return token ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: CustomScrollView(slivers: [
          /// App Bar
          SliverToBoxAdapter(
            child: Padding(padding:  const EdgeInsets.symmetric(horizontal: kMarginLarge, vertical: kMarginMedium),
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
                  Image.asset(
                    kLocationArrowIcon,
                    height: kMarginLarge,
                    width: kMarginLarge,
                  ),
                  const Text(kYangon,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),),
                   const Padding(
                    padding:EdgeInsets.symmetric(horizontal: 14.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: kMarginXLarge,
                    ),
                  ),
                  const Icon(
                    Icons.filter_alt,
                    color: Colors.white,
                    size: kMarginXLarge,
                  ),
                ],
              ),),
          ),

          /// Calendar List View
          SliverToBoxAdapter(
            child: Container(
              height: 130.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Stack(
                          children: [
                            Image.asset(kTimeSlot),
                            Positioned.fill(
                              child: Column(
                                children: [
                                  verticalSpacing(20),
                                  const Text(
                                    "Today",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  verticalSpacing(4),
                                  const Text(
                                    "May",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  verticalSpacing(4),
                                  const Text(
                                    "8",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          /// Chips Cinema Type
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                direction: Axis.horizontal,
                spacing: 8,
                runSpacing: 16,
                children: [
                  Chip(
                    label: Text(
                      "2D",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: kChipBackground,
                  ),
                  Chip(
                    label: Text(
                      "3D",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: kChipBackground,
                  ),
                  Chip(
                    label: Text(
                      "3D IMAX",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: kChipBackground,
                  ),
                  Chip(
                    label: Text(
                      "3D DBOX",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: kChipBackground,
                  ),
                ],
              ),
            ),
          ),

          /// Availability Labels
          const SliverToBoxAdapter(
            child: AvailabilityLabels(secondLabel:kFillingFast,thirdLabel: kAlmostFull, firstColor: kPrimaryColor,secondColor: Colors.deepOrange,thirdColor: kRedPinkColor,),
          ),
          /// Cinema List
          SliverList(delegate: SliverChildBuilderDelegate((context,index){
            return  GestureDetector(
              onTap: (){
                cinemaTimeSlotVisibility();
              },
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
                 child: GridTimeSlotCinema(onTap:(){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> const SeatPlanPage()));
                 }
                   ,),
               ),
                             ),
                new Divider(color: Colors.grey,)
              ]),
            );
          },childCount: 6), )
        ]),
      ),
    ));
  }
}


