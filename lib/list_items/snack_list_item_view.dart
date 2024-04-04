import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/components/cinema_button2.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

class SnackListItemView extends StatefulWidget {

   final int foodItemCount ;

  // final void Function()? onTap;
  final void Function()? onTapMinus;
  final void Function() onTapAdd;

   const SnackListItemView({
    super.key,
    required this.foodItemCount,
    required this.onTapMinus,
    required this.onTapAdd
  });

  @override
  State<SnackListItemView> createState() => _SnackListItemViewState();
}

class _SnackListItemViewState extends State<SnackListItemView> {
   bool isAddBtnVisible = true;
   bool isPlusMinusVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kNowPlayingAndComingSoontradientEndColor,
                  kNowPlayingAndComingSoonGradientStartColor
                ])),
        child: Column(children: [
          /// Food Img
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              kDummyFoodImg,
              height: 100,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          const Align(
            alignment:Alignment.center,
            child: Text(
              kSnackName,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Text(
            kFoodPrice,
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: kTextSmall,
                fontWeight: FontWeight.bold),
          ),

          /// Add Button
          Visibility(
            visible: isAddBtnVisible,
            child:Padding( padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height:30,
                child: CinemaButton2(
                    onPressed: (){
                      setState(() {
                        isAddBtnVisible = false;
                        isPlusMinusVisible = true;
                      });
                    },
                    label: kAdd,
                    borderRadius: 5,
                    bgColor: kPrimaryColor),
              ),
            ),
          ),
          /// Spacer
          const Spacer(),
          /// Plus Minus
          Visibility(
            visible: isPlusMinusVisible,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height:28,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: widget.onTapAdd,
                        child: Image.asset(
                          "assets/images/plus_icon.png",
                          color: kPrimaryColor,),
                      ),

                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: kBookingButtonHeight,
                        child: Center(
                          child: Text(
                            widget.foodItemCount.toString(),
                            style: const TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                            onTap: widget.onTapMinus,
                            child: Image.asset(
                              "assets/images/minus_icon.png",
                              color: kPrimaryColor,)
                        )
                    ),
                  ],
                ),
              ),
            ),
          )
        ]));
  }
}
