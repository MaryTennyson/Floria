
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  Future<dynamic> getIntFromSharedPref() async {
    print('deneme2');
    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getInt('startNumber');
    print('sharedpreferens içindeki numara:');
    print(startupNumber);
    return startupNumber;
  }

  Future<void> oneTimeEnterance() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('startNumber', 1);
  }
}
