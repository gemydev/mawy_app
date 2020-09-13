import 'package:mawy_app/preference_healper/preference_helper.dart';

class Preferences {
  final Map<String, Preference> _preferences;

  const Preferences(this._preferences);

  Preference<T> get<T>(String key) {
    assert(key != null);
    return _preferences.containsKey(key) ? _preferences[key] : null;
  }
}
