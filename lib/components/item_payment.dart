import 'package:flutter/material.dart';
import 'package:the_movie_app_padc/utils/dimens.dart';
import 'package:the_movie_app_padc/utils/images.dart';

class ItemPayment extends StatefulWidget {
  final String imgString;
  final String txtLabel;
  final Color itemColor;
  final double rowPadding;

  const ItemPayment({
    super.key,
    required this.imgString,
    required this.txtLabel,
    required this.itemColor,
    required this.rowPadding,
  });

  @override
  State<ItemPayment> createState() => _ItemPaymentState();
}

class _ItemPaymentState extends State<ItemPayment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: const Border(
          left: BorderSide(
              color: Colors.grey,
              width: 1
          ),
          right:BorderSide(
              color: Colors.grey,
              width: 1
          ),
          bottom: BorderSide(
              color: Colors.grey,
              width: 1
          ),
          top: BorderSide(
              color: Colors.grey,
              width: 1
          ),

        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(widget.rowPadding),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset( (widget.imgString.isEmpty) ? kQuickPay : widget.imgString ,
                height: 26,
                width: 26,
                fit: BoxFit.cover,
                color: Colors.white,),
            ),
            Text(widget.txtLabel,
              style: const TextStyle(
                  fontSize: kTextRegular,
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
