import 'package:flutter/material.dart';
import 'package:mawy_app/constants/colors.dart';
import 'package:mawy_app/data/shared_preferences/prefs_keys.dart';
import 'package:mawy_app/functions/navigation_funs.dart';
import 'package:mawy_app/functions/work_with_api/notification.dart';
import 'package:mawy_app/screens/chat.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationOpen = false;
  int userId ;
  @override
  void initState() {
    functionToGetUserId();
    super.initState();
  }
  functionToGetUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      userId = sharedPreferences.getInt(ID_KEY);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MAIN_COLOR,
        title: Text(
          "الاعدادات",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 15),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Icon(
                      Icons.notifications,
                      color: MAIN_COLOR,
                      size: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "الاشعارات",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: MAIN_COLOR),
                    ),
                  ],
                ),
                Switch(
                    activeColor: MAIN_COLOR,
                    value: _notificationOpen,
                    onChanged: (value) {
                      setState(() {
                        _notificationOpen = value;
                      });
                      turnONNotifications(userId: userId);
                    })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        normalShift(context, ChatScreen());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: MAIN_COLOR,
                            borderRadius: BorderRadius.circular(15)),
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: Icon(
                          Icons.supervised_user_circle,
                          size: 100,
                          color: Color(0xff004f00),
                        ),
                      ),
                    ),
                    Text(
                      "تواصل معنا",
                      style: TextStyle(color: MAIN_COLOR, fontSize: 18),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: _launchURLOfRatingApp,
                      child: Container(
                        decoration: BoxDecoration(
                            color: MAIN_COLOR,
                            borderRadius: BorderRadius.circular(15)),
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: Icon(
                          Icons.assessment,
                          size: 100,
                          color: Color(0xff004f00),
                        ),
                      ),
                    ),
                    Text(
                      "تقييم التطبيق",
                      style: TextStyle(color: MAIN_COLOR, fontSize: 18),
                    )
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: _launchURLOfPrivacy,
                      child: Container(
                        decoration: BoxDecoration(
                            color: MAIN_COLOR,
                            borderRadius: BorderRadius.circular(15)),
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.28,
                        child: Icon(
                          Icons.security,
                          size: 100,
                          color: Color(0xff004f00),
                        ),
                      ),
                    ),
                    Text(
                      "سياسة الخصوصية",
                      style: TextStyle(color: MAIN_COLOR, fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  _launchURLOfPrivacy() async {
    const url = 'http://mobappsbaker.com/privacy.html';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLOfRatingApp() async {
    const url = 'https://play.google.com/store/apps/details?id=com.codecaique.mawy_cut';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
