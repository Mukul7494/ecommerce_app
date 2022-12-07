import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPrefs._();

  /// SHARED PREFERENCES
  static final Future<SharedPreferences> sharedPrefs =
      SharedPreferences.getInstance();

  /// Introduction Screen (Shown once) [bool] (true = shown)
  static const String _isIntroScreenOff = "_isIntroScreenOff";
  static bool isCanShowIntroScreen = true;
  static Future<bool> getCanShowIntroScreen() async {
    final SharedPreferences pref = await sharedPrefs;
    bool value = pref.getBool(_isIntroScreenOff) ?? true;
    return value;
  }

  static Future<void> setIsIntroScreenIsOff() async {
    final SharedPreferences pref = await sharedPrefs;
    pref.setBool(_isIntroScreenOff, false);
  }

  ///
}
