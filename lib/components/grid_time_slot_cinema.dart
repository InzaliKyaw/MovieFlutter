import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/data/vos/cinema_timeslot_vo.dart';
import 'package:the_movie_app_padc/data/vos/timeslots_vo.dart';
import 'package:the_movie_app_padc/pages/seat_plan_page.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

/// GridTimeSlotCinema
class GridTimeSlotCinema extends StatelessWidget {
  final Function() onTap;
   final List<TimeslotVO>? timeslotVOList;

  const GridTimeSlotCinema({
    super.key, required this.onTap, this.timeslotVOList
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 14,
        crossAxisSpacing: 0,
        mainAxisExtent: 140
    ),
      itemBuilder:(context, index) {
        TimeslotVO? timeslotVO = timeslotVOList?[index];
        String? startTime =  timeslotVO?.startTime ?? "";
        return GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:14.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text( startTime,
                       style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                      ),),
                    const Text(k3D,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                      ),),
                    const Text(kScreen1,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                      ),),
                    const Text(kAvailability,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                      ),)
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: timeslotVOList?.length,);
  }
}

