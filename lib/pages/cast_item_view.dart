import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:the_movie_app_padc/data/vos/credit_vo.dart';
import 'package:the_movie_app_padc/network/api_constants.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';

class CastItemView extends StatelessWidget {
  final CreditVO? creditVO;

  const CastItemView({super.key,required this.creditVO});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: CachedNetworkImage(
         imageUrl: kImageBaseUrl + (creditVO?.profilePath ?? ""),
         errorWidget: (_, __, ___) =>
             Image.network(
               "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
               width: kMargin60,
               height: kMargin60,
               fit: BoxFit.cover,
             ),
    ),
        ),
        const SizedBox(width: kMarginMedium2,)
      ],
    );


  }
}
