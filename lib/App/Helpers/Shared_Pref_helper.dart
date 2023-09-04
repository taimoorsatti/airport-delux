import 'package:shared_preferences/shared_preferences.dart';

class Shared_pref_helper{
  Future<bool> setAuthToken(String token)async{
    final pref= await SharedPreferences.getInstance();
    return pref.setString(UserPref.AuthToken.toString(), token);
  }

   Future <String> getAuthToken()async{
    final pref= await SharedPreferences.getInstance();
    return pref.getString(UserPref.AuthToken.toString(),);
  }
}

enum UserPref{
  AuthToken,
}


class SharedPrefrence {

  Future<bool> setLoggedIn(bool status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("logged_in", status);
  }

  Future<bool> getLogedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("logged_in") ?? false;
  }

  Future<bool> setUserId(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("user_id", userId);
  }

  Future<String> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_id")??'';
  }
}