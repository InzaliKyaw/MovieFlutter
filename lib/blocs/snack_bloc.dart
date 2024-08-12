import 'package:flutter/cupertino.dart';

import '../data/models/movie_booking_model.dart';
import '../data/vos/snack_vo.dart';
import '../utils/get_token.dart';

class SnackBloc extends ChangeNotifier {
  List<SnackVO> snackList = [];
  final MovieBookingModel _model = MovieBookingModel();
  bool isDisposed = false;
  int? snackTotal = null;

  SnackBloc() {
    this.snackTotal = (snackTotal == null) ? 0 : snackTotal;

    // String token = "Bearer ${await getTokenFromSharedPreference()}";
    String token = "Bearer 12930|YIEfih7eOpgpPqvkb0Of7SSPhTFZCUqK9jpBEntB";
    _model.getSnackResponse(token).then((value) {
      List<SnackVO>? snackListAll = [];
      snackListAll = value.snackList;
      for (var list in snackListAll!) {
        snackList.add(list);
      }
      if (!isDisposed) {
        notifyListeners();
      }
    });
  }

  void onQuantityChange(int index, int quantity) {
    // Create a copy of the snackList
    List<SnackVO> updatedList = List.from(snackList);
    // Modify the item in the copied list
    updatedList[index].quantity = quantity;
    // Assign the copied list back to snackList
    snackList = updatedList;
    _notifySafely();
  }

  void onSnackTotalChange(int snackTotal) {
    this.snackTotal = snackTotal;
    _notifySafely();
  }

  void onOperatorBtnChange(
      int index, bool addBtnVisible, bool plusMinusVisible) {
    List<SnackVO> updatedList = List.from(snackList);
    updatedList[index].isAddBtnVisible = addBtnVisible;
    updatedList[index].isPlusMinusVisible = plusMinusVisible;
    snackList = updatedList;
    _notifySafely();
  }

  void _notifySafely() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  /// Widget dispose() lote tae achain phan yin error tat mhr mho
  @override
  void dispose() {
    super.dispose();
    isDisposed = true;
  }


}
