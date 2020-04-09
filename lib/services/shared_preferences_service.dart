import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  const SharedPreferencesService();

  /// Instantiation of the SharedPreferences library
  static const String _kPrioritizeElevators = 'prioritizeElevators';
  static const String _kPreferredWashroom = 'prioritizeWashroom';

  // Getter for the prioritize elevator boolean
  static Future<bool> getPrioritizeElevatorBool() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_kPrioritizeElevators) ?? false;
  }

  // Getter for the preferred bathroom
  static Future<String> getPreferredWashroom() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_kPreferredWashroom) ?? 'Male';
  }

  // Setter for the prioritize elevator boolean
  static Future<bool> setPrioritizeElevatorBool(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(_kPrioritizeElevators, value);
  }

  // Setter for the preferred bathroom
  static Future<bool> setPreferredWashroom(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_kPreferredWashroom, value);
  }
}