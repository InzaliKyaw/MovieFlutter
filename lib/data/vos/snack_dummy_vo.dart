import 'package:the_movie_app_padc/utils/images.dart';

class SnackDummyVO{
  String name = "";
  String price = "";
  SnackDummyVO(this.name, this.price);
}
// List<SnackDummyVO> snackList = [
//   SnackDummyVO("Burger Combo", "2000Ks"),
//   SnackDummyVO("Pizza Combo", "2000Ks"),
//   SnackDummyVO("Skewer Combo", "2000Ks"),
//   SnackDummyVO("Squid Combo", "2000Ks"),
//   SnackDummyVO("Ice Cream", "2000Ks"),
//   SnackDummyVO("Popcorn Combo", "2000Ks"),
// ];

class BankItemVO{
  String bankImgString = "";
  String bankName = "";
  BankItemVO(this.bankImgString, this.bankName);
}

List<BankItemVO> bankList = [
  BankItemVO(kUPI, "UPI"),
  BankItemVO(kGiftVoucher, "Gift Voucher"),
  BankItemVO(kQuickPay, "Quick Pay"),
  BankItemVO("assets/images/credit.png", "Credit Card/Debit Card"),
  BankItemVO( "assets/images/redeem_point.png", "Redeem Point"),
  BankItemVO("assets/images/mobile_wallet.png", "Mobile Wallet"),
  BankItemVO( "assets/images/net_banking.png", "Net Banking"),
];

class SettingItemVO{
  String settingImgString = "";
  String settingName = "";
  SettingItemVO(this.settingImgString, this.settingName);
}

List<SettingItemVO> settingItemList = [
  SettingItemVO(kPurchaseIcon, "Purchase History"),
  SettingItemVO("assets/images/bxs_offer.png", "Offer"),
  SettingItemVO("assets/images/gift_card.png", "Gift Card"),
  SettingItemVO("assets/images/location.png", "Location"),
  SettingItemVO( "assets/images/payment.png", "Payment"),
  SettingItemVO("assets/images/help.png", "Help and Support"),
  SettingItemVO( "assets/images/logout.png", "Logout"),
];