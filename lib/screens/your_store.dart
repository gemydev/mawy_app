import 'package:flutter/material.dart';
import 'package:mawy_app/constants/colors.dart';


class YourStoreScreen extends StatefulWidget {
  @override
  _YourStoreScreenState createState() => _YourStoreScreenState();
}

class _YourStoreScreenState extends State<YourStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MAIN_COLOR,
          title: Text(
            "متجرك",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
    );
  }
}
