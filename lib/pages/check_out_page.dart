import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/components/cinema_button2.dart';
import 'package:the_movie_app_padc/components/cinema_button_icon.dart';
import 'package:the_movie_app_padc/components/cinema_button_icon_custom.dart';
import 'package:the_movie_app_padc/components/ticket_button.dart';
import 'package:the_movie_app_padc/pages/payment_page.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/utils/spaces.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

class CheckOutPage extends StatefulWidget {
  final int ttlSeatPrice;
  final int ttlSnackPrice;

  const CheckOutPage({
    super.key,
    required this.ttlSeatPrice,
    required this.ttlSnackPrice,
  });

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  late bool isSnackVisible = false;
  late bool isSnackHide = true;
  late bool isTicketPolicyHide = true;
  late bool isTicketVisible = false;

  @override
  Widget build(BuildContext context) {
    int totalPrice = widget.ttlSnackPrice + widget.ttlSeatPrice + 500;
    return Scaffold(
      backgroundColor: kGrey2,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                      Icons.keyboard_arrow_left_rounded,
                      color: Colors.white,
                      size: kMargin34,
                    ),
                  ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.center,
                       child: Text(
                        kCheckout,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.w700),
                                         ),
                                         ),
                    ),
                ],
              ),
            ),

            /// Checkout Container
            Padding(
              padding: const EdgeInsets.all(kMarginMedium3),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.68,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [kNowPlayingAndComingSoonGradientStartColor,kNowPlayingAndComingSoontradientEndColor ]
                    ),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /// Movie Name
                      const Row(
                        children: [
                          Text(kMovieName,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),),
                          Text(kCinemaType,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18
                              ))
                        ],
                      ),
                      /// Cinema Name
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Text(kCinemaName,
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),),
                            Text(kSCREEN2,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18
                                ))
                          ],
                        ),
                      ),

                      /// Date, Time, Place Icons
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            /// Date
                            SizedBox(height: 120,
                              child: Column(
                                children: [
                                  Image.asset(
                                    kDateIcon,height: 24, width: 24,
                                    color: kPrimaryColor,
                                  ),
                                  verticalSpacing(8),
                                  const Text(
                                    kDate,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14
                                    ),
                                  )
                                ],
                              )
                            ),
                            /// Time
                            Expanded(
                              child: SizedBox(
                                  height: 120,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        kTimeIcon,height: 24, width: 24,
                                        color: kPrimaryColor,
                                      ),
                                      verticalSpacing(8),
                                      const Text(
                                        kTime,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            ),

                            /// Place
                            Container(
                                height: 120,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      kPlaceIcon,height: 24, width: 24,
                                      color: kPrimaryColor,
                                    ),
                                    verticalSpacing(8),
                                    const Text(
                                      kPlace,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14
                                      ),
                                    )
                                  ],
                                )
                            ),

                          ],
                        ),
                      ),
                      /// Ticket Price
                       Row(
                        children: [
                          const Text(kSeatType,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            ),),
                          Spacer(),
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: widget.ttlSeatPrice.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),
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
                              ]
                            )
                           )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        child: Divider(height: 1,color:kNowPlayingAndComingSoontradientEndColor,),
                      ),
                      /// Food and Beverage
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(kFoodIcon,height: 24,width: 24,
                            color: Colors.white,),
                          ),
                          const Text(kFoodBeverage,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),),
                          /// Dropdown Arrow
                          Visibility(
                            visible: isSnackVisible,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  isSnackVisible = false;
                                  isSnackHide = true;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset(kDownArrowIcon,height: 12,width: 12,
                                  color: Colors.white,),
                              ),
                            ),
                          ),
                          /// Up Arrow
                          Visibility(
                            visible: isSnackHide,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  isSnackVisible = true;
                                  isSnackHide = false;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset(kUpIcon,height: 12,width: 12,
                                  color: Colors.white,),
                              ),
                            ),
                          ),
                          const Spacer(),
                          RichText(
                              text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: widget.ttlSnackPrice.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    const TextSpan(
                                      text: kKyats,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16),
                                    )
                                  ]
                              )
                          )

                          // const Text(kFoodPrice,
                          // style: TextStyle(
                          //   fontSize: 16,
                          //     color: Colors.white,
                          //     fontWeight: FontWeight.bold
                          // ),)
                        ],
                      ),
                      /// Snack Item List View
                      Visibility(
                        visible: isSnackVisible,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            height: 60,
                            child: ListView.builder(
                                itemBuilder: (context, index){
                                  return Row(
                                   children: [
                                     Image.asset(kCancelIcon, height: 16,width: 16,),
                                     const Padding(
                                       padding: EdgeInsets.all(4.0),
                                       child: Text(kPotato,
                                       style: TextStyle(
                                         color: Colors.grey,
                                         fontSize: 14,
                                         fontWeight: FontWeight.w600
                                       ),),
                                     ),
                                     const Spacer(),
                                     const Text(kKyats,
                                       style: TextStyle(
                                           color: Colors.grey,
                                           fontSize: 14,
                                           fontWeight: FontWeight.w600
                                       ),)
                                   ]
                                  );
                                },
                              itemCount: 2,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        child: Divider(height: 1,color:kNowPlayingAndComingSoontradientEndColor,),
                      ),
                      /// Convenience session
                      /// Convenience Fee drop down
                      Row(
                        children: [
                          const Text(kConvenience,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.normal
                            ),),
                          /// Dropdown Arrow
                          Visibility(
                            visible: isTicketVisible,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  isTicketVisible = false;
                                  isTicketPolicyHide = true;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset(kDownArrowIcon,height: 12,width: 12,
                                  color: Colors.white,),
                              ),
                            ),
                          ),
                          /// Up Arrow
                          Visibility(
                            visible: isTicketPolicyHide,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  isTicketVisible = true;
                                  isTicketPolicyHide = false;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset(kUpIcon,height: 12,width: 12,
                                  color: Colors.white,),
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Text(k500,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),)
                        ],
                      ),
                      /// Ticket Cancellation Policy Button
                      Align(
                        alignment: Alignment.topLeft,
                        child: Visibility(
                          visible: isTicketVisible,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                            child: GestureDetector(
                              onTap: (){
                                // show the dialog
                                showDialog(context: context, builder: (BuildContext context){
                                  return const TicketCancellationPolicyCard();
                                });
                              },
                              child: Container(
                                  decoration:BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.deepOrange
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          child: Image.asset(kInformationIcon,
                                            height: kIconSize,
                                            width: kIconSize,
                                            color: Colors.white,),
                                        ),
                                        const Text(
                                          kTicketCancellationPolicy,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: kTextSmall),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                      /// Total Session
                      /// Divider
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        child: Divider(height: 1,color:kNowPlayingAndComingSoontradientEndColor,),
                      ),
                      const Spacer(),
                      /// Total Row
                      Row(
                        children: [
                          const Text(kTotal,
                          style: TextStyle(
                            fontSize: kTextRegular3x,
                            fontWeight: FontWeight.w700,
                            color: kPrimaryColor
                          ),),
                          const Spacer(),
                          RichText(
                              text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: totalPrice.toString(),
                                      style: const TextStyle(
                                          fontSize: kTextRegular3x,
                                          fontWeight: FontWeight.w700,
                                          color: kPrimaryColor
                                      ),
                                    ),
                                    const TextSpan(
                                      text:
                                      kKyats,
                                      style: TextStyle(
                                          fontSize: kTextRegular3x,
                                          fontWeight: FontWeight.w700,
                                          color: kPrimaryColor
                                      ),
                                    )
                                  ]
                              )
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            /// Button Continue
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 48,
                  child: TicketButton(btnText: kContinue,btnColor: kPrimaryColor, txtColor:Colors.black, onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const PaymentPage()));

                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TicketCancellationPolicyCard extends StatelessWidget {
  const TicketCancellationPolicyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      ),
      child: Container(
          height: 450,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(kTicketCancellationPolicy,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  ),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(kFoodIcon, height: 20,width: 20,
                        color: Colors.white,),
                      ),
                      const Text(kRefundOnFandB,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: kTextRegular2x,
                        fontWeight: FontWeight.w600
                      ),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.asset(kTicketIcon, height: 20,width: 20,),
                      ),
                      const Text(k75Refund,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: kTextRegular2x,
                            fontWeight: FontWeight.w600
                        ),)
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(kRefundDescriptOne,
                  style: TextStyle(
                    fontSize: kTextSmall,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey
                  ),),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Text(kRefundDescriptTwo,
                    style: TextStyle(
                        fontSize: kTextSmall,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey
                    ),),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0,bottom: 8.0),
                  child: Text(kRefundRuleOne,
                    style: TextStyle(
                        fontSize: kTextRegular,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                    ),),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                  child: Text(kRefundRuleTwo,
                    style: TextStyle(
                        fontSize: kTextRegular,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                    ),),
                ),
                Container(
                  height: 42,
                  width: double.infinity,
                  child: CinemaButton2(onPressed: (){
                    Navigator.of(context).pop();
                  }, label: kDone, bgColor: kPrimaryColor, borderRadius: 5),
                )
              ],
            ),
          )
      ),
    );
  }
}

