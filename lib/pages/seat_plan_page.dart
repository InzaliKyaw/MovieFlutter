import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/components/availability_labels.dart';
import 'package:the_movie_app_padc/components/ticket_button.dart';
import 'package:the_movie_app_padc/data/models/movie_booking_model.dart';
import 'package:the_movie_app_padc/data/vos/seat_plan_vo.dart';
import 'package:the_movie_app_padc/pages/snack_page.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/get_token.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

class SeatPlanPage extends StatefulWidget {
  final int cinemaDayTimeslotId;
  final String selectedDate;

  const SeatPlanPage({super.key, required this.cinemaDayTimeslotId,
  required this.selectedDate});

  @override
  State<SeatPlanPage> createState() => _SeatPlanPageState();
}

class _SeatPlanPageState extends State<SeatPlanPage> {
  bool isSeatVisible = true;
  bool isTextVisible = false;
  final MovieBookingModel _model = MovieBookingModel();
  Color seatColor = Colors.grey;
  double _value = 20;
  double scale = 1;
  List<SeatPlanVO> seatList = [];
  int totalPrice = 0;
  int countTicket = 0;

  @override
  void initState() {
    getSeatPlanFromNetwork(widget.selectedDate, widget.cinemaDayTimeslotId);
    super.initState();
  }

  Future<void> getSeatPlanFromNetwork(String chosenDate, int cinemaDayTimeSlotid) async {
    String token = "Bearer ${await getTokenFromSharedPreference()}";
    _model.getSeatResponse(chosenDate, cinemaDayTimeSlotid, token)
        .then((value) {
      List<List<SeatPlanVO>>? seatPlan = [];
      seatPlan = value.seatPlanList;
      for(var list in seatPlan!) {
        for (var l in list) {
          seatList.add(l);
        }
      }
      setState(() {
        seatList;
      });
    }).catchError((error) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text(error.toString()),
              ));
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),

              /// App Bar
              child: Row(
                children: [
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
                ],
              ),
            ),

            /// Cinema Screen
            SizedBox(
              height: 140,
              width: double.infinity,
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      kScreen,
                      style: TextStyle(
                          color: Colors.white,
                        fontFamily: kDMSansFont,
                        fontSize: 18
                      ),
                    ),
                  ),
                  Image.asset(kCinemaScreen),
                ],
              ),
            ),

            /// Grid Chair
            Transform.scale(
              scale: scale,
              child: SizedBox(
                height: 480,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 14,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) {
                      SeatPlanVO seat = seatList[index];
                      if (seat.type == "available") {
                        seatColor = Colors.white;
                        isTextVisible = false;
                        isSeatVisible = true;
                      } else if (seat.type == "text") {
                        isSeatVisible = false;
                        isTextVisible = true;
                      } else if (seat.type == "your selection") {
                        seatColor = kPrimaryColor;
                        isTextVisible = false;
                        isSeatVisible = true;
                      } else if (seat.type == "taken") {
                        seatColor = Colors.grey;
                        isTextVisible = false;
                        isSeatVisible = true;
                      } else {
                        isTextVisible = false;
                        isSeatVisible = false;
                      }
                      // controlSeat(seat.text, seat.type);
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Visibility(
                            visible: isTextVisible,
                            child: Text(
                              seat.symbol!,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                          Visibility(
                              visible: isSeatVisible,
                              child: GestureDetector(
                                onTap: () {
                                  if (seat.type == "available") {
                                    setState(() {
                                      seat.type = "your selection";
                                      totalPrice += seat.price ?? 0;
                                      countTicket += 1;
                                    });
                                  } else if (seat.type == "your selection") {
                                    setState(() {
                                      seat.type = "available";
                                      totalPrice -= seat.price ?? 0;
                                      countTicket -= 1;
                                    });
                                  }
                                  seatList;
                                },
                                child: Image.asset(
                                  kSeat,
                                  width: 20,
                                  height: 20,
                                  color: seatColor,
                                ),
                              )),
                        ],
                      );
                    },
                    itemCount: seatList.length,
                  ),
                ),
              ),
            ),

            /// Chair Labels
            const AvailabilityLabels(
              secondLabel: kTaken,
              thirdLabel: kYourSelection,
              firstColor: Colors.white,
              secondColor: Colors.grey,
              thirdColor: kPrimaryColor,
            ),

            /// Chair Slider
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_value > 0) {
                            _value -= 10;
                            seatList;
                          }
                        });
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Slider(
                      min: 0.0,
                      max: 100.0,
                      activeColor: Colors.grey,
                      thumbColor: Colors.white,
                      inactiveColor: Colors.grey,
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                          scale = (value / 100) + 1;
                        });
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_value < 100) {
                          _value += 10;
                          seatList;
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Image.asset(
                        kMinusIcon,
                        color: Colors.white,
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// Price and Ticket Button
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: countTicket.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                            const TextSpan(
                              text: kTickets,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18),
                            )
                          ]),
                        ),
                        Text(
                          totalPrice.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: TicketButton(
                      btnText: kBuyTicket,
                      btnColor: kPrimaryColor,
                      txtColor: Colors.black,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SnackPage(ttlSeatPrice: totalPrice,)));
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
