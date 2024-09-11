class SeatVO{
  String text = "";
  String type = "";
  SeatVO(this.text, this.type);
}

List<SeatVO> seatList = [
  /// Normal
  /// Row A
  SeatVO("A", "text"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("", "space"),
  SeatVO("", "space"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("A", "text"),
  /// Row B
  SeatVO("B", "text"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("", "available"),
  SeatVO("", "available"),
  SeatVO("", "space"),
  SeatVO("", "space"),
  SeatVO("", "available"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("B", "text"),

  /// Executive
  ///  Row C
  SeatVO("C", "text"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("", "space"),
  SeatVO("", "space"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("C", "text"),
  ///  Row D
  SeatVO("C", "text"),
  SeatVO("", "taken"),
  SeatVO("", "available"),
  SeatVO("", "taken"),
  SeatVO("", "available"),
  SeatVO("", "space"),
  SeatVO("", "space"),
  SeatVO("", "available"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("C", "text"),

  /// Premium
  ///  Row E
  SeatVO("E", "text"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("", "your selection"),
  SeatVO("", "your selection"),
  SeatVO("", "space"),
  SeatVO("", "space"),
  SeatVO("", "taken"),
  SeatVO("", "available"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("E", "text"),
  ///  Row F
  SeatVO("F", "text"),
  SeatVO("", "taken"),
  SeatVO("", "available"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("", "space"),
  SeatVO("", "space"),
  SeatVO("", "taken"),
  SeatVO("", "available"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("F", "text"),


  ///  Row G
  SeatVO("G", "text"),
  SeatVO("", "taken"),
  SeatVO("", "space"),
  SeatVO("", "available"),
  SeatVO("", "available"),
  SeatVO("", "taken"),
  SeatVO("", "taken"),
  SeatVO("", "available"),
  SeatVO("", "available"),
  SeatVO("", "space"),
  SeatVO("", "available"),
  SeatVO("G", "text"),


];