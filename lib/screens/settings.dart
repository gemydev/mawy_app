import 'package:flutter/material.dart';
import 'package:mawy_app/constants/colors.dart';
class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationOpen = false;
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MAIN_COLOR,
        title: Text("الاعدادات", style: TextStyle(
            fontSize: 22 , fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15 , right: 15 , top: 10 , bottom: 15),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Icon(Icons.notifications ,color: MAIN_COLOR,size: 30,),
                    SizedBox(width: 15,),
                    Text("الاشعارات", style: TextStyle(
                        fontSize: 25 , fontWeight: FontWeight.bold ,color: MAIN_COLOR
                    ),),
                  ],
                ),
                Switch(
                    activeColor: MAIN_COLOR,
                    value: _notificationOpen,
                    onChanged: (value) {
                      setState(() {
                        _notificationOpen = value;
                      });
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
                    Container(
                      decoration: BoxDecoration(
                          color: MAIN_COLOR,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      height: MediaQuery.of(context).size.height*0.15,
                      width: MediaQuery.of(context).size.width*0.28,
                      child: Icon(Icons.supervised_user_circle, size: 100, color: Color(0xff004f00),),
                    ),
                    Text("تواصل معنا" , style: TextStyle(
                        color: MAIN_COLOR ,fontSize: 18
                    ),)
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: MAIN_COLOR,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      height: MediaQuery.of(context).size.height*0.15,
                      width: MediaQuery.of(context).size.width*0.28,
                      child: Icon(Icons.assessment , size: 100, color: Color(0xff004f00),),
                    ),
                    Text("تقييم التطبيق" , style: TextStyle(
                        color: MAIN_COLOR ,fontSize: 18
                    ),)
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: MAIN_COLOR,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      height: MediaQuery.of(context).size.height*0.15,
                      width: MediaQuery.of(context).size.width*0.28,
                      child: Icon(Icons.security, size: 100, color: Color(0xff004f00),),
                    ),
                    Text("سياسة الخصوصية" , style: TextStyle(
                        color: MAIN_COLOR ,fontSize: 18
                    ),)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}