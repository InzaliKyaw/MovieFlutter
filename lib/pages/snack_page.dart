import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_app_padc/blocs/snack_bloc.dart';
import 'package:the_movie_app_padc/components/cinema_button2.dart';
import 'package:the_movie_app_padc/data/vos/snack_vo.dart';
import 'package:the_movie_app_padc/pages/check_out_page.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/utils/spaces.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

class SnackPage extends StatefulWidget {
  final int ttlSeatPrice;
  const SnackPage({super.key,
  required this.ttlSeatPrice});

  @override
  State<SnackPage> createState() => _SnackPageState();
}

class _SnackPageState extends State<SnackPage> {
  /// Price, Quantity, Name

  /// Now showing or coming soon
  String selectedText = kAll;
  bool isAddBtnVisible = true;
  bool isPlusMinusVisible = false;
  String currentFoodFoto = kComboFoodImg;
  int snkTotalLocal = 0;
  List<SnackVO> choseSnkLst = [];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SnackBloc(),
      child: Scaffold(
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
                        horizontal: kMarginMedium, vertical: kMarginLarge),
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
                              fontFamily: kDMSansFont,
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
                                    builder: (context) => CheckOutPage( ttlSnackPrice: snkTotalLocal,ttlSeatPrice: widget.ttlSeatPrice,)));
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
                    child: Consumer<SnackBloc>(
                      builder: (context, bloc, model) => GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 24,
                                mainAxisExtent: 200),
                        itemBuilder: (context, index) {
                          SnackVO snackVO = bloc.snackList[index];
                          int foodItemCount =
                              bloc.snackList[index].quantity ?? 0;
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
                                  child: Image.network(
                                    bloc.snackList[index].snackUrl ?? "",
                                    height: 100,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    bloc.snackList[index].name ?? "",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  bloc.snackList[index].price.toString() ?? "0",
                                  style: const TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: kTextSmall,
                                      fontWeight: FontWeight.bold),
                                ),

                                /// Add Button
                                Visibility(
                                  visible:
                                      bloc.snackList[index].isAddBtnVisible,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height: 30,
                                      child: CinemaButton2(
                                          onPressed: () {
                                            bloc.onOperatorBtnChange(
                                                index, false, true);
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
                                  visible:
                                      bloc.snackList[index].isPlusMinusVisible,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height: 28,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: GestureDetector(
                                              onTap: () {
                                                var snackBloc =
                                                    context.read<SnackBloc>();
                                                if (foodItemCount >= 0) {
                                                  foodItemCount += 1;
                                                  snackBloc.snackList[index]
                                                      .quantity += 1;
                                                  snkTotalLocal += snackBloc
                                                      .snackList[index].price;
                                                  bloc.onSnackTotalChange(
                                                      snkTotalLocal);
                                                  snackBloc.onQuantityChange(
                                                      index,
                                                      snackBloc.snackList[index]
                                                          .quantity);
                                                  if (!choseSnkLst.contains(
                                                      snackBloc
                                                          .snackList[index])) {
                                                    choseSnkLst.add(snackBloc
                                                        .snackList[index]);
                                                  }
                                                  // bloc.addToChosenList(choseSnkLst);
                                                } else {
                                                  bloc.onOperatorBtnChange(
                                                      index, true, false);
                                                }
                                              },
                                              child: Image.asset(
                                                "assets/images/plus_icon.png",
                                                color: kPrimaryColor,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              height: kBookingButtonHeight,
                                              child: Center(
                                                child: Text(
                                                  bloc.snackList[index].quantity
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: kPrimaryColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: GestureDetector(
                                                  onTap: () {
                                                    if (bloc.snackList[index]
                                                            .quantity >
                                                        0) {
                                                      bloc.snackList[index]
                                                              .quantity =
                                                          snackVO.quantity - 1;
                                                      snkTotalLocal -= bloc
                                                          .snackList[index]
                                                          .price;
                                                      bloc.onSnackTotalChange(
                                                          snkTotalLocal);
                                                      bloc.onQuantityChange(
                                                          index,
                                                          bloc.snackList[index]
                                                              .quantity);
                                                    }
                                                    if (bloc.snackList[index]
                                                            .quantity ==
                                                        0) {
                                                      bloc.onOperatorBtnChange(
                                                          index, true, false);
                                                      // bloc.removeFromChosenList(bloc.snackList[index]);
                                                    }
                                                  },
                                                  child: Image.asset(
                                                    "assets/images/minus_icon.png",
                                                    color: kPrimaryColor,
                                                  ))),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ]));
                        },
                        itemCount: bloc.snackList.length,
                      ),
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

                  /// Child snack button
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24.0),
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kPrimaryColor),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                /// Dialog
                                showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ChangeNotifierProvider(
                                      create: (context) => SnackBloc(),
                                      child: Container(
                                        height: 300,
                                        padding: const EdgeInsets.all(16.0),
                                        decoration: const BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            // You can add a header or title here if needed
                                            SizedBox(
                                              height: 160,
                                              child: Consumer<SnackBloc>(
                                                builder:
                                                    (context, bloc, model) =>
                                                        ListView.builder(
                                                  itemCount:
                                                      choseSnkLst.length ?? 0,
                                                  itemBuilder:
                                                      (context, index) {
                                                    List<SnackVO> snacks =
                                                        choseSnkLst;
                                                    String snackName =
                                                        choseSnkLst[index]
                                                                .name ??
                                                            "";
                                                    int eachSnkPrice =
                                                        choseSnkLst[index]
                                                                .price *
                                                            choseSnkLst[index]
                                                                .quantity;
                                                    bloc.onSnackTotalChange(
                                                        snkTotalLocal);
                                                    return (snacks.isNotEmpty)
                                                        ? Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                snackName,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              // Plus Minus
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: SizedBox(
                                                                  width: 100,
                                                                  height: 28,
                                                                  child: Stack(
                                                                    children: [
                                                                      Align(
                                                                        alignment:
                                                                            Alignment.topLeft,
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            choseSnkLst[index].quantity +=
                                                                                1;
                                                                            int snkIndex = bloc.snackList.indexWhere((snack) =>
                                                                                snack.id ==
                                                                                choseSnkLst[index].id);
                                                                            for (var snk
                                                                                in bloc.snackList) {
                                                                              if (choseSnkLst[index].id == snk.id) {
                                                                                // snk.quantity += 1;
                                                                                snkTotalLocal += snk.price;
                                                                                snk.quantity += 1;
                                                                                bloc.onQuantityChange(snkIndex, choseSnkLst[index].quantity);
                                                                                bloc.onSnackTotalChange(snkTotalLocal);
                                                                                print(snkTotalLocal.toString());
                                                                              }
                                                                            }
                                                                          },
                                                                          child:
                                                                              Image.asset(
                                                                            "assets/images/plus_icon.png",
                                                                            color:
                                                                                kPrimaryColor,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.4,
                                                                          height:
                                                                              kBookingButtonHeight,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              choseSnkLst[index].quantity.toString(),
                                                                              style: const TextStyle(
                                                                                color: kPrimaryColor,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment:
                                                                            Alignment.topRight,
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            if (choseSnkLst[index].quantity >
                                                                                0) {
                                                                              choseSnkLst[index].quantity -= 1;
                                                                              int snkIndex = bloc.snackList.indexWhere((snack) => snack.id == choseSnkLst[index].id);
                                                                              for (var snk in bloc.snackList) {
                                                                                if (snk.id == choseSnkLst[index].id) {
                                                                                  snk.quantity -= 1;
                                                                                  snkTotalLocal -= snk.price;
                                                                                  bloc.onSnackTotalChange(snkTotalLocal);
                                                                                  bloc.onQuantityChange(index, choseSnkLst[index].quantity);
                                                                                }
                                                                              }
                                                                              // snackQuantity = snacks[index].quantity;
                                                                            }
                                                                          },
                                                                          child:
                                                                              Image.asset(
                                                                            "assets/images/minus_icon.png",
                                                                            color:
                                                                                kPrimaryColor,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              RichText(
                                                                text: TextSpan(
                                                                    children: <TextSpan>[
                                                                      TextSpan(
                                                                        text: eachSnkPrice
                                                                            .toString(),
                                                                        style: const TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: Colors.white,
                                                                            fontSize: 16),
                                                                      ),
                                                                      const TextSpan(
                                                                        text:
                                                                            kKyats,
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: Colors.white,
                                                                            fontSize: 16),
                                                                      )
                                                                    ]),
                                                              ),
                                                            ],
                                                          )
                                                        : Container();
                                                  },
                                                ),
                                              ),
                                            ),
                                            // Snack Button
                                            const Spacer(),

                                            /// Child snack button
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 24.0),
                                                  height: 48,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: kPrimaryColor),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const Spacer(),
                                                      Consumer<SnackBloc>(
                                                        builder: (context, bloc,
                                                                model) =>
                                                            Text(
                                                          bloc.snackTotal
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 14),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                             CheckOutPage(ttlSeatPrice: widget.ttlSeatPrice, ttlSnackPrice: snkTotalLocal)));
                                                          },
                                                          child: const Icon(Icons
                                                              .chevron_right))
                                                    ],
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 8),
                                    child: Image.asset(
                                      kFoodIcon,
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                  Image.asset(kDownArrowIcon,
                                      height: 14, width: 14)
                                ],
                              ),
                            ),
                            const Spacer(),
                            Consumer<SnackBloc>(
                              builder: (context, bloc, model) => Text(
                                bloc.snackTotal.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                               CheckOutPage(ttlSnackPrice: snkTotalLocal,ttlSeatPrice: widget.ttlSeatPrice,)));
                                },
                                child: const Icon(Icons.chevron_right))
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
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
                    fontSize: kTextRegular,
                    fontFamily: kDMSansFont,
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
