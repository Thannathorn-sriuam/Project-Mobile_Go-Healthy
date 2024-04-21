import 'package:shared_preferences/shared_preferences.dart';

class CaloriesHelper {
  static void addCalories(int amount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int currentCalories = prefs.getInt('calories') ?? 0;
    int updatedCalories = currentCalories + amount;
    await prefs.setInt('calories', updatedCalories);
  }
}
