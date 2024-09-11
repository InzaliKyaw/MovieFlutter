import 'package:the_movie_app_padc/components/item_payment.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/utils/spaces.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      /// Single Child Scroll View Err
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        /// Profile Header
        Stack(
        children: [
        Image.asset(
          kProfileBg,
          width: double.infinity,
          fit: BoxFit.cover,
          height: 200,
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
              children: [
                Image.asset(
                  kProfileImg,
                  height: 100,
                  width: 100,
                ),
                verticalSpacing(24),
                TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(0, 255, 106, 0.10)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    child: const Text(
                      kLoginSignUp,
                      style: TextStyle(
                          color: kPrimaryColor, fontSize: 12),
                      textAlign: TextAlign.center,
                    ))
              ]),
        )
        ],
      ),
      Expanded(
        child: ListView.builder(itemBuilder: (context, index) {
          return const ItemPayment(
            imgString: kPurchaseIcon, txtLabel: kPurchaseHistory, itemColor: Colors.grey,rowPadding: 24,);
        }, itemCount: 7,),
      ),
    ],),
    ),
    );}
}
