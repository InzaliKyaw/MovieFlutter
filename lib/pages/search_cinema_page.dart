import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/components/grid_time_slot_cinema.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/utils/spaces.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

class SearchCinemaPage extends StatefulWidget {
  const SearchCinemaPage({super.key});

  @override
  State<SearchCinemaPage> createState() => _SearchCinemaPageState();
}

class _SearchCinemaPageState extends State<SearchCinemaPage> {
  bool isCinemaVisible = false;
  RangeValues _currentRangeValues = const RangeValues(0, 60);


  void cinemaTimeSlotVisibility() {
    setState(() {
      if (isCinemaVisible == false) {
        isCinemaVisible = true;
      } else {
        isCinemaVisible = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          /// Search bar
          Row(
            children: [
              /// Back Arrow
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

              /// Search Box
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  height: 48,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextField(
                    decoration: const InputDecoration(
                      prefixIcon: IconTheme(
                          data: IconThemeData(color: Colors.white),
                          child: Icon(Icons.search)),
                      focusColor: kPrimaryColor,
                      border: InputBorder.none,
                      hintText: kSearch,
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.normal),
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),
              ),
              const Spacer(),

              /// Filter Button
              const Padding(
                padding: EdgeInsets.only(right: 14.0),
                child: Icon(
                  Icons.filter_alt,
                  color: kPrimaryColor,
                  size: 32,
                ),
              )
            ],
          ),
          verticalSpacing(14),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                    height: 32,
                    decoration:  BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    // child: const CustomDropDownButton(["Genres", "Thriller", "Comedy", "Action"])),
                  )),
              const CustomDropDownButton(dropDownItems: ["Facilities", "Thriller", "Comedy", "Action"],)
            ],
          ),
          verticalSpacing(14),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Price Range Slider
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: Text(kPriceRange,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),),
                ),
               verticalSpacing(14),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                      child: Text(k3500,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.normal
                        ),),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                      child: Text(k29500,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.normal
                        ),),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RangeSlider(
                    values: _currentRangeValues,
                    max: 100,
                    divisions: 5,
                    activeColor: kPrimaryColor,
                    inactiveColor: kGreyC8,
                    labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                  ),
                ),
                verticalSpacing(18),
                /// Show Times
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  child: Text(kShowTimes,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),),
                ),
                verticalSpacing(14),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                      child: Text(k8am,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.normal
                        ),),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                      child: Text(k12pm,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.normal
                        ),),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RangeSlider(
                    values: _currentRangeValues,
                    max: 100,
                    divisions: 5,
                    activeColor: kPrimaryColor,
                    inactiveColor: kGreyC8,
                    labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          verticalSpacing(14),
          /// Cinema Result View
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    cinemaTimeSlotVisibility();
                  },
                  child: Container(
                    child: Column(children: [
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 14.0, right: 14.0, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              kJunctionCity,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                            ),
                            Text(
                              kSeeDetails,
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor: kPrimaryColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Wrap(
                        alignment: WrapAlignment.start,
                        direction: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      child: Image.asset(
                                        kParkingIcon,
                                        height: 16,
                                        width: 16,
                                      ),
                                    ),
                                    const Text(
                                      kParking,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      child: Image.asset(
                                        kOnlineFoodIcon,
                                        height: 16,
                                        width: 16,
                                      ),
                                    ),
                                    const Text(
                                      kOnlineFood,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      child: Image.asset(
                                        kWheelChairIcon,
                                        height: 16,
                                        width: 16,
                                      ),
                                    ),
                                    const Text(
                                      kWheelChair,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: isCinemaVisible,
                        child: Container(
                          height: 300,
                          child: GridTimeSlotCinema(
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> const CinemaDetailPage()));
                            },
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      )
                    ]),
                  ),
                );
              },
              itemCount: 2,
            ),
          )
        ],
      )),
    );
  }
}


///DropDown button
class CustomDropDownButton extends StatefulWidget {
  final List<String> dropDownItems ;

  const CustomDropDownButton({super.key,
  required this.dropDownItems});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {

  var selectedItem = "";

  @override
  void initState(){
    super.initState();
    selectedItem = widget.dropDownItems.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            value: selectedItem,
            items: widget.dropDownItems.map((item) =>
                DropdownMenuItem(
                  value: item,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(item, style: const TextStyle(color: Colors.black,
                        fontWeight: FontWeight.normal)),
                  ),
                )).toList(),
            onChanged: (value){
              setState(() {
                selectedItem = value ?? "";
              });
            }),
      ),
    );
  }

}
