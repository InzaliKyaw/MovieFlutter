import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/list_items/movie_list_item_view.dart';
import 'package:the_movie_app_padc/utils/colors.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/spaces.dart';
import 'package:the_movie_app_padc/utils/strings.dart';


class SearchMoviePage extends StatefulWidget {
  const SearchMoviePage({super.key});

  @override
  State<SearchMoviePage> createState() => _SearchMoviePageState();
}

class _SearchMoviePageState extends State<SearchMoviePage> {

  late bool showResultGrid = false;

  /// Movies To Show
  List<MovieVO> moviesToShow = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            verticalSpacing(24),
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
                  padding:  const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    height: 48,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                        decoration: const InputDecoration(
                          prefixIcon:  IconTheme(
                              data: IconThemeData(
                                  color: Colors.white
                              ),
                              child: Icon(Icons.search)
                          ),
                          focusColor: kPrimaryColor,
                          border: InputBorder.none,
                          hintText: kSearch,
                          hintStyle: TextStyle(color: Colors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        onChanged: (text){
                           setState(() {
                             showResultGrid = true;
                           });
                        },),
                  ),
                ),
                const Spacer(),
                /// Filter Button
                const Padding(
                  padding: EdgeInsets.only(right: 14.0),
                  child: Icon(Icons.filter_alt,
                  color: kPrimaryColor,
                  size: 32,),
                )
              ],
            ),
             /// Drop Down
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
                 const CustomDropDownButton()
               ],
             ),

            verticalSpacing(8),
            /// Search Result View
            Visibility(
              visible: showResultGrid,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
                  child: GridView.builder(gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: kMarginMedium3,
                          crossAxisSpacing: kMarginMedium3,
                          mainAxisExtent: kMovieListItemHeight
                      ), itemBuilder: (context,index){
                      return  MovieListItemView(movieVO: moviesToShow[index],);
                  }, itemCount: 1,),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

///DropDown button
class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({super.key});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {

  var dropDownItems = ["Genres", "Thriller", "Comedy", "Action"];
  var selectedItem = "";

  @override
  void initState(){
    super.initState();
    selectedItem = dropDownItems.first;
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
            items: dropDownItems.map((item) =>
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

