import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/components/ticket_button.dart';
import 'package:the_movie_app_padc/pages/check_out_page.dart';
import 'package:the_movie_app_padc/pages/snack_page.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

class TicketDetail extends StatefulWidget {
  const TicketDetail({Key? key}) : super(key: key);

  @override
  State<TicketDetail> createState() => _TicketDetailState();
}

class _TicketDetailState extends State<TicketDetail> {
  late bool isSnackVisible = false;
  late bool isSnackHide = true;
  late bool isTicketPolicyHide = true;
  late bool isTicketVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          backgroundColor: kGrey2,
          body: Column(
            children: [
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
                    const Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          kTicketDetail,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
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
                  height: MediaQuery.of(context).size.height * 0.7,
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
                        const Row(
                          children: [
                            Text(kSeatType,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                              ),),
                            Spacer(),
                            Text(kSeatPrice,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                              ),)
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
                            const Text(kFoodPrice,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),)
                          ],
                        ),
                        /// Snack Item List View
                        Visibility(
                          visible: isSnackVisible,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Container(
                              height: 80,
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
                                        const Text(kSnackPrice,
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
                                        color: Colors.red
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
                        const Row(
                          children: [
                            Text(kTotal,
                              style: TextStyle(
                                  fontSize: kTextRegular3x,
                                  fontWeight: FontWeight.w700,
                                  color: kPrimaryColor
                              ),),
                            Spacer(),
                            Text(kTotalPrice,
                              style: TextStyle(
                                  fontSize: kTextRegular3x,
                                  fontWeight: FontWeight.w700,
                                  color: kPrimaryColor
                              ),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

              /// Ticket Row
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
                            kRefundAmt,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: kTextRegular),
                          ),
                          Text(
                            kPriceKyats,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                                fontSize: kTextRegular3x),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: TicketButton(
                        btnText: kCancelBooking,
                        btnColor: Colors.red,
                        txtColor: Colors.white,
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=> SnackPage()));
                        },
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ));
  }
}
