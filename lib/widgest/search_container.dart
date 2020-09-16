import 'package:flutter/material.dart';
import 'package:mawy_app/constants/colors.dart';

Widget searchBox(
    {BuildContext context,
    TextEditingController controller,
    Function updateFunction}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.1,
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
              controller: controller,
              onChanged: updateFunction,
              showCursor: false,
              autofocus: true,
              decoration: InputDecoration(
                hintText: " بحث",
                hintStyle: TextStyle(fontSize: 20),
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
