import 'package:bloc/bloc.dart';
import 'package:mawy_app/preference_healper/preference_helper.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'preferences.dart';

class PreferenceBloc extends Bloc<PreferenceEvent, PreferenceState> {
  final SharedPreferences sharedPreferences;

  final List<Preference> _usagePreferences;

  PreferenceBloc({
    @required this.sharedPreferences,
    @required List<Preference> usagePreferences,
  })  : _usagePreferences = usagePreferences,
        assert(sharedPreferences != null),
        assert(usagePreferences != null), super(null);

  PreferenceState get initialState => _loadPreferences();

  @override
  Stream<PreferenceState> mapEventToState(PreferenceEvent event) async* {
    if (event is UpdatePreference) {
      var updatedPreference = event.updatedPreference;
      await _setPreference(updatedPreference);
      yield _loadPreferences();
    }
  }

  PreferenceState _loadPreferences() {
    var preferencesMap = Map<String, Preference>();
    _usagePreferences
        .map((preference) => _getPreference(preference))
        .forEach((preference) => preferencesMap[preference.key] = preference);
    var updatedTime = DateTime.now().millisecondsSinceEpoch;
    return PreferenceState(
      updatedTime: updatedTime,
      preferences: Preferences(preferencesMap),
    );
  }


  Preference _getPreference(Preference preference) {
    var preferenceType = preference.typeOfPreference();
    if (preferenceType == int) {
      preference.value = sharedPreferences.getInt(preference.key);
    } else if (preferenceType == double) {
      preference.value = sharedPreferences.getDouble(preference.key);
    } else if (preferenceType == String) {
      preference.value = sharedPreferences.getString(preference.key);
    } else if (preferenceType == bool) {
      preference.value = sharedPreferences.getBool(preference.key);
    } else if (preferenceType == List) {
      preference.value = sharedPreferences.getStringList(preference.key);
    } else {
      throw TypeException();
    }
    if (preference.value == null) {
      preference.value = preference.initValue;
    }
    return preference;
  }

  Future _setPreference(Preference preference) async {
    var preferenceType = preference.typeOfPreference();
    if (preferenceType == int) {
      await sharedPreferences.setInt(preference.key, preference.value);
    } else if (preferenceType == double) {
      await sharedPreferences.setDouble(preference.key, preference.value);
    } else if (preferenceType == String) {
      await sharedPreferences.setString(preference.key, preference.value);
    } else if (preferenceType == bool) {
      await sharedPreferences.setBool(preference.key, preference.value);
    } else if (preferenceType == List) {
      await sharedPreferences.setStringList(preference.key, preference.value);
    } else {
      throw TypeException();
    }
  }


  Preference<T> getPreference<T>(String key) {
    return state.preferences.get<T>(key);
  }
}
