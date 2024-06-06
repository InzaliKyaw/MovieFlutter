
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_movie_app_padc/components/availability_labels.dart';
import 'package:the_movie_app_padc/components/grid_time_slot_cinema.dart';
import 'package:the_movie_app_padc/data/models/movie_booking_model.dart';
import 'package:the_movie_app_padc/data/vos/cinema_timeslot_vo.dart';
import 'package:the_movie_app_padc/data/vos/custom_timeslot_vo.dart';
import 'package:the_movie_app_padc/pages/seat_plan_page.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/get_token.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/utils/spaces.dart';
import 'package:the_movie_app_padc/utils/strings.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';

import '../data/vos/timeslots_vo.dart';

class TimeSlotPage extends StatefulWidget {
  const TimeSlotPage({super.key});

  @override
  State<TimeSlotPage> createState() => _TimeSlotPageState();
}

class _TimeSlotPageState extends State<TimeSlotPage> {
  bool isCinemaVisible = false;
  final MovieBookingModel _model = MovieBookingModel();
  List<CinemaTimeSlotVO> cinemaList = [];
  final now = DateTime.now();
  late List<CustomTimeslotVO> dateList = [];
  int selectedIndex = 0;
  Color? primaryColor;
  late String selectedDate;

  void cinemaTimeSlotVisibility(bool isSelected) {
      if(isSelected){
        isCinemaVisible = true;
      }else{
        isCinemaVisible = false;
      }
      //   if (isCinemaVisible == false) {
      //     isCinemaVisible =  true;
      //   } else {
      //     isCinemaVisible = false;
      //   }
      // }else{
      //   isCinemaVisible = false;
      // }
  }

  Future<void> getCinemaFromNetwork(String chosenDate) async {
    String token = await getTokenFromSharedPreference();
    _model.getCinemaDayTime(chosenDate, token).then((value) {
      if (value.code == 200) {
        if (value.data != null) {
          setState(() {
            cinemaList = value.data!;
          });
        }
      } else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Text(value.message ?? "Content not found"),
                ));
      }
    }).catchError((error) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text(error.toString()),
              ));
    });
  }

  @override
  void initState() {
    DateTime currentDateTime = DateTime(now.year, now.month, now.day);
    selectedDate = DateFormat('yyyy-MM-dd').format(currentDateTime);
    dateList = generateTwoWeeks();
     setState(() {
       dateList;
     });
     if(selectedDate.isNotEmpty){
       getCinemaFromNetwork(selectedDate);
     }
     super.initState();
  }

  Future<int> getIdFromSharedPreference() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();

    // get an integer value from 'num' key.
    int? id = prefs.getInt('id');
    return id ?? 0;
  }


  List<CustomTimeslotVO> generateTwoWeeks(){
    var twoweeks = 13;
    // List<String> twoWeeks = [];
    List<CustomTimeslotVO> twoWeeks = [];
    for(int i=0; i<= twoweeks; i++){
      DateTime currentDateTime = DateTime(now.year, now.month, now.day + i);
       if( i == 0){
         CustomTimeslotVO customTimeslotVO = CustomTimeslotVO(currentDateTime, true);
         twoWeeks.add(customTimeslotVO);
       }else{
         CustomTimeslotVO customTimeslotVO = CustomTimeslotVO(currentDateTime, false);
         twoWeeks.add(customTimeslotVO);
       }
      // twoWeeks.add(formattedDate);
    }
    return twoWeeks;
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
            child: Padding(
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
                  const Spacer(),
                  Image.asset(
                    kLocationArrowIcon,
                    height: kMarginLarge,
                    width: kMarginLarge,
                  ),
                  const Text(
                    kYangon,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
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
              ),
            ),
          ),

          /// Calendar List View
          SliverToBoxAdapter(
            child: Container(
              height: 130.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dateList.length,
                  itemBuilder: (context, index) {
                    DateTime dateTimeF = dateList[index].date ?? now;
                    String formattedDate = DateFormat('EEE-MMM-d').format(dateTimeF);
                     var dayList =  formattedDate.split("-");
                    bool isSelected = dateList[index].isSelected ?? false;
                    String day;
                    String month;
                    String date;
                    if(dayList.isNotEmpty){
                      if(index == 0){
                        day = "Today";
                      }else if(index == 1){
                        day = "Tomorrow";
                      }else{
                        day = dayList[0];
                      }
                      if(isSelected){
                        primaryColor = kPrimaryColor;
                      }else{
                        primaryColor = kWhite;
                      }
                       month = dayList[1];
                       date = dayList[2];
                    }else{
                      day = "";
                      month = "";
                      date = "";
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          var curIndex = index;
                          String chosenDate = DateFormat('yyyy-MM-dd').format(dateTimeF);
                          setState(() {
                            dateList[index].isSelected = true;
                            for(int i = 0; i< dateList.length; i++){
                              if(i!= curIndex){
                                dateList[i].isSelected = false;
                              }
                            }
                            dateList;
                          });
                          getCinemaFromNetwork(chosenDate);
                        },
                        child: CalendarWidget(primaryColor: primaryColor, day: day, month: month, date: date),
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
            child: AvailabilityLabels(
              secondLabel: kFillingFast,
              thirdLabel: kAlmostFull,
              firstColor: kPrimaryColor,
              secondColor: Colors.deepOrange,
              thirdColor: kRedPinkColor,
            ),
          ),

          /// Cinema List
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              CinemaTimeSlotVO cinema = cinemaList[index];
              String? cinemaName =
                  cinema.cinema != null ? cinemaList[index].cinema : "";
              List<TimeslotVO>? timeslotList = cinemaList[index].timeslot;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;

                    cinemaList[index].isSelected = true;
                    for(int i = 0; i< dateList.length; i++){
                      if(i!= selectedIndex){
                        cinemaList[i].isSelected = false;
                      }
                    }
                    cinemaTimeSlotVisibility(cinemaList[index].isSelected ?? false);
                  });
                },
                child: Column(children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 14.0, right: 14.0, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cinemaName!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 16),
                        ),
                        const Text(
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Image.asset(
                                    kParkingIcon,
                                    height: 16,
                                    width: 16,
                                  ),
                                ),
                                const Text(
                                  kParking,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Image.asset(
                                    kOnlineFoodIcon,
                                    height: 16,
                                    width: 16,
                                  ),
                                ),
                                const Text(
                                  kOnlineFood,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Image.asset(
                                    kWheelChairIcon,
                                    height: 16,
                                    width: 16,
                                  ),
                                ),
                                const Text(
                                  kWheelChair,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                   visible: isCinemaVisible ,
                    child: SizedBox(
                      height: 300,
                      child: GridTimeSlotCinema(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SeatPlanPage(cinemaDayTimeslotId: cinema.cinemaId?? 0,)));
                        },
                        timeslotVOList: timeslotList,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  )
                ]),
              );
            }, childCount: cinemaList.length),
          )
        ]),
      ),
    ));
  }
}

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    super.key,
    required this.primaryColor,
    required this.day,
    required this.month,
    required this.date,
  });

  final Color? primaryColor;
  final String day;
  final String month;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         Image.asset(kTimeSlot,color: primaryColor,),
        Positioned.fill(
          child: Column(
            children: [
              verticalSpacing(20),
               Text(
                day,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              verticalSpacing(4),
               Text(
                month,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              verticalSpacing(4),
               Text(
                date,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
