import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/data/vos/movie_vo.dart';
import 'package:the_movie_app_padc/utils/images.dart';
import 'package:the_movie_app_padc/utils/strings.dart';

class HorizontalMovieListView extends StatelessWidget {
  final Function onTap;
  final List<MovieVO>? mNowPlayingMovieList;

  const HorizontalMovieListView({
    super.key,required this.onTap,required this.mNowPlayingMovieList
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mNowPlayingMovieList?.length,
        itemBuilder: (context,index){
          MovieVO? movieVO = mNowPlayingMovieList?[index];
          String? imageUrl = movieVO?.getBackdropPathWithBaseUrl();
          String? movieName = movieVO?.title;

          return Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 10.0),
            child: GestureDetector(
              onTap: (){

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
                        style: TextStyle(
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
        });
  }
}
