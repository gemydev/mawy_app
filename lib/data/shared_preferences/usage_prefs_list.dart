import 'package:mawy_app/data/shared_preferences/prefs_keys.dart';
import 'package:mawy_app/preference_healper/src/preference.dart';

List<Preference> usagePreferenceList = [
  Preference<String>(key: FIRST_NAME_KEY, initValue: ""),
  Preference<String>(key: LAST_NAME_KEY, initValue: ""),
  Preference<String>(key: NAME_KEY, initValue: ""),
  Preference<String>(key: PHONE_NUMBER_KEY, initValue: ""),
  Preference<String>(key: FIREBASE_TOKEN_KEY, initValue: ""),
  Preference<String>(key: USER_NAME_KEY, initValue: ""),
  Preference<String>(key: ID_KEY, initValue: ""),
  Preference<String>(key: SHOP_NAME_KEY, initValue: ""),
  Preference<bool>(key: KEEP_USER_LOGGED_IN_KEY, initValue: false)
];