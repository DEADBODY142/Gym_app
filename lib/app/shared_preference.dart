
import 'package:shared_preferences/shared_preferences.dart';

class Shared_Preference_Help{

  static Future<void> saveCredentials(String mail, String password) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('mail', mail);
    prefs.setString('password', password);
  }

  static Future<Map<String, String?>> getCredentials() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? mail = prefs.getString('mail');
    final String? password = prefs.getString('password');
    return{
      'mail': mail,
      'password': password,
    };
  }
}