import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Wraps the [SharedPreferences].
class PrefUtils {
  static final Logger _log = Logger("Prefs");

  String? deviceId;

  SharedPreferences? _preferences;

  /// The [prefix] is used in keys for user specific preferences. You can use unique user-id for multi_user
  // String get prefix => "my_app";
  String get keySelectedThemeId => "my_app_SelectedThemeId";

  String get keyPlayerID => "playerId";

  String get keyIsShowThemeSelection => "keyIsShowThemeSelection";

  String get keyIsShowIntro => "keyIsShowIntro";

  String get FILE_DEVIDE_INFO => "deviceDetail";

  String get keyIsUserLogin => "keyIsUserLogin";

  String get keyToken => "keyToken";

  String get keyUserDetail => "keyUserDetail";

  String get isSplashSeen => "isSplashSeen";

  String get isTermsAccepted => 'isTermsAccepted';

  String get keyUserVerified => 'keyUserVerified';

  bool? isHomeVisible;

  Future<void> init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  /// Gets the int value for the [key]   if it exists.
  int getInt(String key, {int defaultValue = 0}) {
    try {
      init();
      return _preferences!.getInt(key) ?? defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  /// Gets the bool value for the [key] if it exists.
  bool? getBool(String key, {bool defaultValue = false}) {
    try {
      var va = _preferences!.getBool(key);

      return va;
    } catch (e) {
      return defaultValue;
    }
  }

  /// Gets the String value for the [key] if it exists.
  String getString(String key, {String defaultValue = ""}) {
    try {
      init();
      return _preferences!.getString(key) ?? defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  /// Gets the string list for the [key] or an empty list if it doesn't exist.
  List<String> getStringList(String key) {
    try {
      init();
      return _preferences!.getStringList(key) ?? <String>[];
    } catch (e) {
      return <String>[];
    }
  }

  /// Gets the int value for the [key] if it exists.
  void saveInt(String key, int value) {
    init();
    _preferences!.setInt(key, value);
  }

  /// Gets the int value for the [key] if it exists.
  void saveBoolean(String key, bool value) {
    init();
    _preferences!.setBool(key, value);
  }

  /// Gets the int value for the [key] if it exists.
  void saveString(String key, String value) {
    init();
    _preferences!.setString(key, value);
  }

  /// Gets the string list for the [key] or an empty list if it doesn't exist.
  void saveStringList(String key, List<String> value) {
    init();
    _preferences!.setStringList(key, value);
  }

  void saveShowThemeSelection(bool showThemeSelection) {
    _preferences!.setBool(keyIsShowThemeSelection, showThemeSelection);
  }

  bool isShowIntro() {
    return getBool(keyIsShowIntro) ?? false;
  }

  void saveTermsAccepted(bool isTerms) {
    _preferences!.setBool(isTermsAccepted, isTerms);
  }

  void saveShowIntro(bool showIntro) {
    print(showIntro);
    _preferences!.setBool(keyIsShowIntro, showIntro);
  }

  //TO CHECK WEATHER USER LOGIN OR NOT
  bool isUserLogin() {
    return getBool(keyIsUserLogin) ?? false;
  }

  bool isUserVerified() {
    return getBool(keyUserVerified) ?? false;
  }

  bool isTermsAccepteds() {
    return getBool(isTermsAccepted) ?? false;
  }

  String getUserToken() {
    return getString(keyToken);
  }

  void saveUserToken(String token) {
    _preferences!.setString(keyToken, token);
  }

  //Save-User data;

  void clearPreferenceAndDB() async {
    bool showIntro = isShowIntro();
    int prefixVal = getInt(keySelectedThemeId);

    _preferences!.clear();

    saveInt(keySelectedThemeId, prefixVal);
    saveShowIntro(showIntro);

    // await AppDatabase.instance.masterDao.deleteAllMasterItems();

    // await CacheManager.getInstance().deleteFolderExist('/storage');
  }

  resetAndLogout(BuildContext context) {
    // clear all data and Preferences
    // app.resolve<PrefUtils>().clearPreferenceAndDB();
  }
}
