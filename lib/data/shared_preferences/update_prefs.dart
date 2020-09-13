import 'package:mawy_app/preference_healper/src/preference.dart';
import 'package:mawy_app/preference_healper/src/preference_bloc.dart';
import 'package:mawy_app/preference_healper/src/preference_event.dart';

List<Preference<String>> getPreferences(
    List<String> keys, PreferenceBloc preferenceBloc) {
  List<Preference<String>> listOfPreferences;

  for (String item in keys) {
    listOfPreferences.add(preferenceBloc.getPreference<String>(item));
  }
  return listOfPreferences;
}

updateDataOfUser(
    {PreferenceBloc preferenceBloc,
    List<String> keys,
    String firstName,
    lastName,
    shopName,
    id,
    name,
    userName,
    firebaseToken,
    phoneNumber}) {
  List<Preference<String>> prefs = getPreferences(keys, preferenceBloc);
  prefs[0].value = firstName;
  prefs[1].value = lastName;
  prefs[2].value = shopName;
  prefs[3].value = id;
  prefs[4].value = userName;
  prefs[5].value = firebaseToken;
  prefs[6].value = name;
  prefs[7].value = phoneNumber;
  for (var item in prefs) {
    preferenceBloc.add(UpdatePreference(item));
  }
}
