import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/components/cinema_button_icon.dart';
import 'package:the_movie_app_padc/components/item_payment.dart';
import 'package:the_movie_app_padc/pages/ticket_done.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                       kPayment,
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
           /// Your Name box
           Padding(
             padding: const EdgeInsets.all(24.0),
             child: TextFormField(
               decoration:  InputDecoration(
                   hintText: kEnterYourName,
                   focusedBorder: OutlineInputBorder(
                     borderSide: const BorderSide(color: kPrimaryColor),
                     borderRadius: BorderRadius.circular(5),
                   ),
                   enabledBorder: OutlineInputBorder(
                     borderSide: const BorderSide(color: Colors.grey),
                     borderRadius: BorderRadius.circular(5),
                   ),
                   border: OutlineInputBorder(
                     borderSide: const BorderSide(color: Colors.grey),
                     borderRadius: BorderRadius.circular(5),
                   ),
                   hintStyle: const TextStyle(
                       fontSize: 12,
                       color: kPrimaryColor
                   )
               ),
             ),
           ),
           /// Unlock offer button
            Padding(
             padding: EdgeInsets.all( 24.0),
             child: CinemaButtonIcon(img: kOfferIcon, label: kOffer, bgColor: kPrimaryColor,onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> const TicketDone()));
             },),
           ),
           /// Choose Payment Label
           const Align(
             alignment: Alignment.topLeft,
             child: Padding(
               padding: EdgeInsets.symmetric(horizontal: 16.0),
               child: Text(kChoosePayment,
                 style: TextStyle(
                     fontSize: 18,
                     color: kPrimaryColor,
                     fontWeight: FontWeight.w700
                 ),),
             ),
           ),
           /// List View payments
           Expanded(
             child: ListView.builder(itemBuilder: (context,index){
               return const Padding(
                 padding: EdgeInsets.all(8.0),
                 child: ItemPayment(imgString: kPaymentIcon, txtLabel: kQuickPay, itemColor: Colors.white,rowPadding:14),
               );
             },
               itemCount: 7,),
           )
         ],
                    ),
      ),
    );
  }
}

