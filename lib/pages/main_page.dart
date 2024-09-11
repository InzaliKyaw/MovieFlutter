import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/pages/cinemas_page.dart';
import 'package:the_movie_app_padc/pages/home_page.dart';
import 'package:the_movie_app_padc/pages/profile_page.dart';
import 'package:the_movie_app_padc/pages/ticket_page.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;
  List<Widget> screenWidgets = [const HomePage(), const CinemasPage(), const TicketsPage(), const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: kPrimaryColor,
        selectedFontSize: kTextSmall,
        unselectedFontSize: kTextSmall,
        unselectedItemColor: kBottonNavigationUnSelectedColor,
        showUnselectedLabels: true,
        backgroundColor: kBackgroundColor,
        type: BottomNavigationBarType.fixed,
        onTap: (selectedIndex) {
          setState(() {
            currentIndex = selectedIndex;
          });
        },
        items: _getBottomNavigationItems(),
      ),
      body: screenWidgets[currentIndex],
    );
  }
  
    List<BottomNavigationBarItem> _getBottomNavigationItems(){
      return [
        /// Movies
        BottomNavigationBarItem(
            icon: Image.asset(
              kMoviesIcon,
              width: kMarginXLarge,
              height: kMarginXLarge,
            ),
            activeIcon: Image.asset(
              kMoviesIcon,
              width: kMarginXLarge,
              height: kMarginXLarge,
              color: kPrimaryColor,
            ),
          label: kMoviesLabel
        ),
        /// Cinemas
        BottomNavigationBarItem(
            icon: Image.asset(
              kCinemasIcon,
              width: kMarginXLarge,
              height: kMarginXLarge,
            ),
            activeIcon: Image.asset(
              kCinemasIcon,
              width: kMarginXLarge,
              height: kMarginXLarge,
              color: kPrimaryColor,
            ),
            label: kCinemasLabel
        ),
        /// Tickets
        BottomNavigationBarItem(
            icon: Image.asset(
              kTicketIcon,
              width: kMarginXLarge,
              height: kMarginXLarge,
            ),
            activeIcon: Image.asset(
              kTicketIcon,
              width: kMarginXLarge,
              height: kMarginXLarge,
              color: kPrimaryColor,
            ),
            label: kTicketsLabel
        ),
        /// Profile
        BottomNavigationBarItem(
            icon: Image.asset(
              kProfileIcon,
              width: kMarginXLarge,
              height: kMarginXLarge,
            ),
            activeIcon: Image.asset(
              kProfileIcon,
              width: kMarginXLarge,
              height: kMarginXLarge,
              color: kPrimaryColor,
            ),
            label: kProfitLabel
        ),
      ];
    }
  }
