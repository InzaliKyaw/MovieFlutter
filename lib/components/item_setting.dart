import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/images.dart';

class ItemSetting extends StatefulWidget {
  final String imgString;
  final String txtLabel;
  final Color itemColor;
  final double rowPadding;

  const ItemSetting({
    super.key,
    required this.imgString,
    required this.txtLabel,
    required this.itemColor,
    required this.rowPadding,
  });

  @override
  State<ItemSetting> createState() => _ItemSettingState();
}

class _ItemSettingState extends State<ItemSetting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: const Border(
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(widget.rowPadding),
        child: Row(
          children: [
            Padding(
              padding:const EdgeInsets.symmetric(horizontal:  12.0),
              child: Image.asset( (widget.imgString.isEmpty) ? kQuickPay : widget.imgString ,
                height: 28,
                width: 28,
                fit: BoxFit.fitHeight,
                color: Colors.white,),
            ),
            Text(widget.txtLabel,
              style: const TextStyle(
                  fontSize: kTextRegular2x,
                  color: Colors.white,
                  fontFamily: 'DMSans',
                  fontWeight: FontWeight.w700
              ),
            ),
             const Spacer(),
             Icon(Icons.chevron_right,
              color: widget.itemColor,)
          ],
        ),
      ),
    );
  }
}
