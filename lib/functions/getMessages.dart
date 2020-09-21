
import 'package:shared_preferences/shared_preferences.dart';

listedMessages({List<String> list})async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setStringList("list_of_messages", list ?? []);
}

Future<List<String>> getMessages() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getStringList("list_of_messages") ?? [];
}