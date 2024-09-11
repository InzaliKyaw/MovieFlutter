import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/components/ticket_item_view.dart';
import 'package:the_movie_app_padc/pages/ticket_details.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/images.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
        /// App Bar with Search, Noti and Scan Icons
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: kBackgroundColor,
          actions: [
            const Icon(
              Icons.search,
              color: Colors.white,
              size: kMarginLarge,
            ),
            const SizedBox(
              width: kMarginLarge,
            ),
            const Icon(
              Icons.notifications,
              color: Colors.white,
              size: kMarginLarge,
            ),
            const SizedBox(
              width: kMarginMedium3,
            ),
            Image.asset(
              kScanIcon,
              width: kMarginLarge,
              height: kMarginLarge,
            ),
            const SizedBox(
              width: kMarginLarge,
            ),
          ],
        ),
        body: SizedBox(
        height: 800,
        child: Padding(
          padding: const EdgeInsets.all(kMarginMedium3),
          child: ListView.builder(itemBuilder: (context,index){
            return TicketItemView(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const TicketDetail()));

            },);
          },itemCount: 2,),
        ),
      )
    );
  }
}
