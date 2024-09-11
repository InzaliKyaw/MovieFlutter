import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/pages/seat_plan_page.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

/// GridTimeSlotCinema
class GridTimeSlotCinema extends StatelessWidget {
  final Function() onTap;
  const GridTimeSlotCinema({
    super.key, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 14,
        crossAxisSpacing: 0,
        mainAxisExtent: 140
    ),
      itemBuilder:(context, index) {
        return GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:14.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(k930PM,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                      ),),
                    Text(k3D,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                      ),),
                    Text(kScreen1,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                      ),),
                    Text(kAvailability,
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
      itemCount: 4,);
  }
}

