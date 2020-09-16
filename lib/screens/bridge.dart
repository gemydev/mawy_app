import 'package:flutter/material.dart';
import 'package:mawy_app/constants/constants.dart';
import 'package:mawy_app/data/shared_preferences/prefs_keys.dart';
import 'package:mawy_app/screens/login.dart';
import 'package:mawy_app/screens/your_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BridgeScreen extends StatefulWidget {

  @override
  _BridgeScreenState createState() => _BridgeScreenState();
}

class _BridgeScreenState extends State<BridgeScreen> {
  bool isUserLoggedIn = false;

  @override
  void initState() {
    _function();
    super.initState();
  }
  _function()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isUserLoggedIn = sharedPreferences.getBool(KEEP_USER_LOGGED_IN_KEY) ?? false;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: MAIN_COLOR, accentColor: MAIN_COLOR),
      initialRoute: isUserLoggedIn ? 'your_store' : 'login',
      routes: {
        'login' : (context) => Login(),
        'your_store' : (context) => YourStore()
      },
    );
  }
}
