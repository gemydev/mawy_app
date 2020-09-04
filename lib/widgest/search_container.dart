import 'package:flutter/material.dart';
import 'package:mawy_app/constants/colors.dart';
class SearchContainer extends StatefulWidget {
  @override
  _SearchContainerState createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.1,
      color: MAIN_COLOR,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListTile(
              title: TextFormField(
                showCursor: false ,
                decoration: InputDecoration(
                  hintText: " بحث",
                  hintStyle: TextStyle(
                    fontSize: 20
                  ),
                  border: InputBorder.none,
                ),
              ),
              trailing: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
