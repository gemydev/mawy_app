import 'package:http/http.dart' as http;

Future<void> turnONNotifications({int userId}) async {
  http.Response response = await http.get(
    'http://mawyApi.codecaique.com/api/turn_ONNotifications?user_id=$userId',
  );
  if (response.statusCode != 200) {
    throw Exception('error');
  }
}

Future<void> showNotifications({int userId}) async {
  http.Response response = await http.get(
    'http://mawyApi.codecaique.com/api/show_Notifications?user_id=$userId',
  );
  if (response.statusCode != 200) {
    throw Exception('error');
  }
}
