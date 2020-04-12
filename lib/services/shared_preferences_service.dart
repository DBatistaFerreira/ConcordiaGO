import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  const SharedPreferencesService();

  // Pre-load variables to skip Future
  static bool prioritizeElevators = false;

  /// Instantiation of the SharedPreferences library
  static const String _kPrioritizeElevators = 'prioritizeElevators';

  // Getter for the prioritize elevator boolean
  static Future<bool> getPrioritizeElevatorBool() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_kPrioritizeElevators) ?? false;
  }

  // Setter for the prioritize elevator boolean
  static Future<bool> setPrioritizeElevatorBool(bool value) async {
    prioritizeElevators = value;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(_kPrioritizeElevators, value);
  }

  // Update prioritize elevator boolean
  static Future<bool> updatePrioritizeElevatorBool() async {
    return prioritizeElevators = await getPrioritizeElevatorBool();
  }
}