import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/components/horizontal_movie_list_view.dart';
import 'package:the_movie_app_padc/components/smart_horizontal_list_view.dart';
import 'package:the_movie_app_padc/components/title_textfield.dart';
import 'package:the_movie_app_padc/list_items/movie_list_item_view.dart';
import '../data/vos/movie_vo.dart';
import '../pages/movie_details_page.dart';

class BestPopularMoviesAndSerialsSectionView extends StatelessWidget {
  final List<MovieVO>? mNowPlayingMovieList;
  final String title;
  final Function onListEndReached;

  const BestPopularMoviesAndSerialsSectionView({
    super.key,required this.mNowPlayingMovieList, required this.title, required this.onListEndReached,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: TitleTextField(title: title,),
        ),
        SizedBox(
            height: 280,
            /// Book List
            child: SmartHorizontalListView(
              itemCount: mNowPlayingMovieList?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {

              MovieVO? movieVO = mNowPlayingMovieList?[index];
              String? imageUrl = movieVO?.getBackdropPathWithBaseUrl();
               String? movieName = movieVO?.title;
               int movieId = movieVO?.id ?? 0;
                return Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetailsPage(
                        movieId:  movieVO?.id.toString()?? "",
                      ),));
                    },
                    child: SizedBox(
                      width: 128,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                imageUrl!,
                                height: 200,
                                width: 138,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 200,
                            child:  Text(movieName!,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.white
                              ),),
                          ),
                          // const Text(kDMovieIssue,
                          //   style: TextStyle(
                          //     fontSize: 12,
                          //   ),),
                          const Row(
                            children: [
                              Text("3.5",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white
                                ),),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 18.0),
                                child: Icon(Icons.star,
                                  color: Colors.amber,
                                  size: 12,),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              padding: EdgeInsets.only(left: 24)
              , onListEndReached: this.onListEndReached,
              ),
            // child: HorizontalMovieListView(onTap: ( ){
            //
            // }, mNowPlayingMovieList: mNowPlayingMovieList, onListEndReached: ,)               //     builder: (context) =>  BookDetails(title: title ?? "", author: author ?? "", description: description ?? "", bookImage: imageUrl,)));
        ),
      ],
    );
  }
}