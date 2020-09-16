import 'package:flutter/material.dart';
import 'package:mawy_app/constants/colors.dart';
import 'package:mawy_app/screens/bridge.dart';
import 'package:mawy_app/screens/login.dart';
import 'package:mawy_app/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    OffersScreen(),
    StoresScreen(),
    BridgeScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      iconSize: 25,
      unselectedItemColor: MAIN_COLOR,
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      selectedItemColor: MAIN_COLOR,
      backgroundColor: SECOND_COLOR,
      items: [
        BottomNavigationBarItem(
          backgroundColor: SECOND_COLOR,
          icon: Icon(
            Icons.star,
          ),
          title: Text('عروض'),
        ),
        BottomNavigationBarItem(
          backgroundColor: SECOND_COLOR,
          icon: Icon(Icons.shopping_basket),
          title: Text('متاجر'),
        ),
        BottomNavigationBarItem(
            backgroundColor: SECOND_COLOR,
            icon: Icon(Icons.store),
            title: Text('متجرك')),
        BottomNavigationBarItem(
            backgroundColor: SECOND_COLOR,
            icon: Icon(Icons.settings),
            title: Text('الاعدادات'))
      ],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

  }
}
