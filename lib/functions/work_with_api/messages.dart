import 'package:http/http.dart' as http;
import 'package:mawy_app/data/shared_preferences/prefs_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> sendMessage({String message}) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await http
      .post('http://mawyApi.codecaique.com/api/make_suggestion', body: {
    'user_id': sharedPreferences.getInt(ID_KEY).toString(),
    'message': message,
  });
}
