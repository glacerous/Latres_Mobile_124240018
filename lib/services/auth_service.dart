import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _keyLogin = 'isLoggedIn';
  static const String _keyUsername = 'username';

  static Future<void> saveLogin(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyLogin, true);
    await prefs.setString(_keyUsername, username);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyLogin) ?? false;
  }

  static Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUsername) ?? '';
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyLogin, false);
    await prefs.remove(_keyUsername);
  }
}