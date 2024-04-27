import 'package:shared_preferences/shared_preferences.dart';

Future<String> getTokenFromSharedPreference() async {
  // Obtain shared preferences.
  final prefs = await SharedPreferences.getInstance();

  // get an integer value from 'num' key.
  String? token = prefs.getString('token');
  return token ?? "";
}