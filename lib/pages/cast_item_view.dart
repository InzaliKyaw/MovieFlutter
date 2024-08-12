import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:the_movie_app_padc/data/vos/credit_vo.dart';
import 'package:the_movie_app_padc/network/api_constants.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';

class CastItemView extends StatefulWidget {
  final CreditVO creditVO;

  const CastItemView({super.key,required this.creditVO});

  @override
  State<CastItemView> createState() => _CastItemViewState();
}

class _CastItemViewState extends State<CastItemView> {
  @override
  Widget build(BuildContext context) {
    // String? kImgUrl = kImageBaseUrl + widget.creditVO.profilePath ?? "";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 60,
        height: 60,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.network(
          kImageBaseUrl + (widget.creditVO.profilePath ?? ""),
        fit: BoxFit.cover,
        ),
      ),
    );


  }
}
