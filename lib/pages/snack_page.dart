import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/components/cinema_button2.dart';
import 'package:the_movie_app_padc/list_items/snack_list_item_view.dart';
import 'package:the_movie_app_padc/pages/check_out_page.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/utils/spaces.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

/// GridView Item not working
class SnackPage extends StatefulWidget {
  const SnackPage({super.key});

  @override
  State<SnackPage> createState() => _SnackPageState();
}

class _SnackPageState extends State<SnackPage> {
  /// Now showing or coming soon
  String selectedText = kAll;
  int foodItemCount = 0;
  bool isAddBtnVisible = true;
  bool isPlusMinusVisible = false;
  String currentFoodFoto = kComboFoodImg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey2,
      body: Column(
        children: [
          /// Heading Section
          /// App Bar and Tab Bar
          Container(
            color: kBackgroundColor,
            child: Column(
              children: [
                verticalSpacing(24),

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
                      const Text(
                        kGrabABite,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: kMarginXLarge,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CheckOutPage()));
                        },
                        child: const Text(
                          kSkip,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),

                /// Tab Bar
                SnackTabBar(
                  selectedText: selectedText,
                  onTapNowShowingOrComingSoon: (text) {
                    setState(() {
                      selectedText = text;
                      if (text == kCombo) {
                        currentFoodFoto = kComboFoodImg;
                      } else if (text == kSnack) {
                        currentFoodFoto = kSnackImg;
                      } else if (text == kPopcorn) {
                        currentFoodFoto = kPopCornImg;
                      } else if (text == kBeverage) {
                        currentFoodFoto = kBeverageImg;
                      } else {
                        currentFoodFoto = kDummyFoodImg;
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                ///All Food Item Grid View
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 24,
                            mainAxisExtent: 200),
                    itemBuilder: (context, index) {
                      return SnackListItemView( foodItemCount: foodItemCount,
                        onTapMinus: () {
                        setState(() {
                          if(foodItemCount>0){
                            foodItemCount -= 1;
                          }else{
                            isAddBtnVisible = true;
                            isPlusMinusVisible = false;
                          }
                        });
                      }, onTapAdd: () {
                            setState(() {
                            if(foodItemCount>=0){
                            foodItemCount += 1;
                            }else{
                            isAddBtnVisible = true;
                            isPlusMinusVisible = false;
                            }
                        });
                        });
                    },
                    itemCount: 20,
                  ),
                ),

                /// Bottom Gradient and Booking Button
                /// Bottom Gradient
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: kMovieDetailsBottomContainerHeight,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, kBackgroundColor])),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24.0),
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kPrimaryColor),
                    child: SnackButton(
                      onTapMinus: () {

                      },
                      onTapPlus: () {

                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Main Snack Button with drop down and chevron_right
class SnackButton extends StatelessWidget {
  final Function() onTapPlus;
  final Function() onTapMinus;

  const SnackButton({
    super.key,
    required this.onTapPlus,
    required this.onTapMinus,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0))),
                  child: Column(
                    children: [
                      /// First Snack
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(kPotatoesChips,
                          style: TextStyle(
                            color: Colors.white
                          ),),
                          /// Plus Minus
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 100,
                              height:28,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: GestureDetector(
                                      onTap: onTapPlus,
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
                                      child: const Center(
                                        child: Text(
                                          "1",
                                          style: TextStyle(
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
                                          onTap:onTapMinus,
                                          child: Image.asset(
                                            "assets/images/minus_icon.png",
                                            color: kPrimaryColor,)
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Text(kSnackPrice,
                            style: TextStyle(
                                color: Colors.white
                            ),),
                        ],
                      ),
                      /// Second Snack
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(kPotatoesChips,
                            style: TextStyle(
                                color: Colors.white
                            ),),
                          /// Plus Minus
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 100,
                              height:28,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: GestureDetector(
                                      onTap: onTapPlus,
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
                                      child: const Center(
                                        child: Text(
                                          "1",
                                          style: TextStyle(
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
                                          onTap:onTapMinus,
                                          child: Image.asset(
                                            "assets/images/minus_icon.png",
                                            color: kPrimaryColor,)
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Text(kSnackPrice,
                            style: TextStyle(
                                color: Colors.white
                            ),),
                        ],
                      ),
                      Spacer(),
                      /// Snack Button
                      const SnackButton2()
                    ],
                  ),
                );
              },
            );
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 8),
                child: Image.asset(
                  kFoodIcon,
                  height: 24,
                  width: 24,
                ),
              ),
              Image.asset(kDownArrowIcon, height: 14, width: 14)
            ],
          ),
        ),
        const Spacer(),
        const Text(
          kFoodPrice,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CheckOutPage()));
            },
            child: const Icon(Icons.chevron_right))
      ],
    );
  }
}

class SnackButton2 extends StatelessWidget {
  const SnackButton2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(left: 24.0,right: 24.0,bottom: 14.0),
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kPrimaryColor),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: Image.asset(
                    kFoodIcon,
                    height: 24,
                    width: 24,
                  ),
                ),
                Image.asset(kUpIcon, height: 14, width: 14)
              ],
            ),
          ),
          const Spacer(),
          const Text(
            kFoodPrice,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CheckOutPage()));
              },
              child: const Icon(Icons.chevron_right))
        ],
      ),
    );
  }
}

class SnackTabBar extends StatelessWidget {
  final String selectedText;
  final Function(String) onTapNowShowingOrComingSoon;

  const SnackTabBar(
      {super.key,
      required this.selectedText,
      required this.onTapNowShowingOrComingSoon});

  Widget build(BuildContext context) {
    return Container(
      height: kNowPlayingAndComingSoonTabBarHeight,
      width: MediaQuery.of(context).size.width * 1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: kBackgroundColor),
      child: Row(
        children: [
          /// Now Showing Button
          Expanded(
            child: SnackButtonView(
              label: kAll,
              isSelected: selectedText == kAll,
              onTapButton: () {
                onTapNowShowingOrComingSoon(kAll);
              },
            ),
          ),

          /// Combo Button
          Expanded(
            child: SnackButtonView(
              label: kCombo,
              isSelected: selectedText == kCombo,
              onTapButton: () {
                onTapNowShowingOrComingSoon(kCombo);
              },
            ),
          ),

          /// Coming Soon Button
          Expanded(
            child: SnackButtonView(
              label: kSnack,
              isSelected: selectedText == kSnack,
              onTapButton: () {
                onTapNowShowingOrComingSoon(kSnack);
              },
            ),
          ),

          /// Coming Soon Button
          Expanded(
            child: SnackButtonView(
              label: kPopcorn,
              isSelected: selectedText == kPopcorn,
              onTapButton: () {
                onTapNowShowingOrComingSoon(kPopcorn);
              },
            ),
          ),

          /// Coming Soon Button
          Expanded(
            child: SnackButtonView(
              label: kBeverage,
              isSelected: selectedText == kBeverage,
              onTapButton: () {
                onTapNowShowingOrComingSoon(kBeverage);
              },
            ),
          )
        ],
      ),
    );
  }
}

class SnackButtonView extends StatelessWidget {
  final bool isSelected;
  final String label;
  final Function onTapButton;

  const SnackButtonView(
      {super.key,
      required this.isSelected,
      required this.label,
      required this.onTapButton});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onTapButton();
        },
        child: Container(
          margin: const EdgeInsets.all(kMarginMedium),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: (isSelected)
                        ? kNowPlayingAndComingSoonSelectedTextColor
                        : kNowPlayingAndComingSoonSelectedTextColor,
                    fontSize: kTextSmall,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: (isSelected) ? kPrimaryColor : null,
                    borderRadius: BorderRadius.circular(kMarginSmall),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
