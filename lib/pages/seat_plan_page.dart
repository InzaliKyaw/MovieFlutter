import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/components/availability_labels.dart';
import 'package:the_movie_app_padc/components/ticket_button.dart';
import 'package:the_movie_app_padc/data/vos/seat_vo.dart';
import 'package:the_movie_app_padc/pages/snack_page.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

class SeatPlanPage extends StatefulWidget {
  const SeatPlanPage({super.key});

  @override
  State<SeatPlanPage> createState() => _SeatPlanPageState();
}

class _SeatPlanPageState extends State<SeatPlanPage> {
  bool isSeatVisible = true;
  bool isTextVisible = false;
  Color seatColor = Colors.grey;
  double _value = 20;
  double scale = 1;


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
            Stack(
              children: [
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    kScreen,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Image.asset(kCinemaScreen),
              ],
            ),

            /// Grid Chair
            Transform.scale(
              scale: scale,
              child: SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 12,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) {
                      SeatVO seat = seatList[index];
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
                              seat.text,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                          Visibility(
                              visible: isSeatVisible,
                              child: Image.asset(
                                kSeat,
                                width: 24,
                                height: 24,
                                color: seatColor,
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
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Row(
                children: [
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          if(_value < 100){
                            _value += 10;
                          }
                        });
                      },
                      child: const Icon(Icons.add,
                      color: Colors.white,),
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
                          scale = (value/100) + 1;
                        });
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        if(_value > 0){
                          _value -= 10;
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Image.asset(kMinusIcon,
                      color: Colors.white,
                      height: 24,
                      width: 24,),
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
                  const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          kTicketNumber,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                        Text(
                          kPriceKyats,
                          style: TextStyle(
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
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> SnackPage()));
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
