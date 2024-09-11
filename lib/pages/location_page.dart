import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/data/models/movie_booking_model.dart';
import 'package:the_movie_app_padc/pages/main_page.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/spaces.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

class LocationPage extends StatefulWidget {
  final int? userId;
  const LocationPage({super.key,required this.userId});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  /// Model
  final MovieBookingModel _model = MovieBookingModel();
  List<String> cities = [];

  @override
  void initState() {
    getCities();
    super.initState();
  }

  void getCities(){
    _model.getCitiesFromNetwork().then((value) {
      for(var data in value){
        cities.add(data.name ?? "");
      }
      setState(() {
        cities;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /// App bar
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.chevron_left,
              color: Colors.grey,
            ),
          ),
          backgroundColor: kBackgroundColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Pick Region",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            verticalSpacing(24),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    height: 48,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                        gradient: const LinearGradient(colors: [
                          kNowPlayingAndComingSoontradientEndColor,
                          kMovieDetailsCensorRatingGradientEndColor
                        ])
                    ),
                    child: TextField(
                        decoration: InputDecoration(
                      prefixIcon:  const IconTheme(
                          data: IconThemeData(
                            color: kPrimaryColor
                          ),
                          child: Icon(Icons.search)
                      ),
                      hintText: kSearch,
                      hintStyle: const TextStyle(color: Colors.grey,
                      fontWeight: FontWeight.normal),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                    )),
                  ),
                ),
                /// Location Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> MainPage()));
                    },
                    child: ClipRRect(
                      child: Image.asset(
                        "assets/images/icon_location.png",
                        width: 48,
                        height: 48,
                      ),
                    ),
                  ),
                )
              ],
            ),
            verticalSpacing(24),
            Align(
                alignment: Alignment.topRight,
                child: Image.asset("assets/images/city.png",height: kImgHeight50,width:kImgWidth90,fit: BoxFit.fill,)),
            Container(
              width: MediaQuery.of(context).size.width,
              color: kChipBackground,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(kCities,
                style: TextStyle(
                  fontSize: kTextRegular2x,
                  color: Colors.white
                ),),
              ),
            ),
            verticalSpacing(10),
            Expanded(
              child: ListView.builder(itemBuilder: (context,index){
                String? city = cities.isEmpty ? "": cities[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment:Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text(city,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: kTextRegular2x,
                              color: Colors.white
                          ),),
                      ),
                    ),
                    const Divider(color: kChipBackground,)
                  ],
                );
              }, itemCount: cities.length,),
            )
          ],
        ),
      ),
    );
  }
}
