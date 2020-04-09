import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  const SharedPreferencesService();

  /// Instantiation of the SharedPreferences library
  static const String _kPrioritizeElevators = 'prioritizeElevators';

  // Getter for the prioritize elevator boolean
  static Future<bool> getLanguageCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_kPrioritizeElevators) ?? false;
  }

  // Setter for the prioritize elevator boolean
  static Future<bool> setLanguageCode(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(_kPrioritizeElevators, value);
  }
}