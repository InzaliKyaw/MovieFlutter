import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/pages/login_page.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/c_logo.png",
            height: kCinemaLogoHeight,
            width: kTicketMovieHeight,),
          ],
        ),
      )
    );

  }
}
