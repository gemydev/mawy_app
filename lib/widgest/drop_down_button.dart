import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget dropDownButton({String dropdownValue, Function function}) {
  return StatefulBuilder(
    builder: (context, setState) {
      return DropdownButton(
        value: dropdownValue,
        items: [
          DropdownMenuItem(
            child: Text("الكل"),
            value: "الكل",
          ),
          DropdownMenuItem(
            child: Text("ffff"),
            value: "ffff",
          ),
          DropdownMenuItem(
            child: Text("mmm"),
            value: "mmm",
          ),
        ],
        onChanged: function,
      );
    },
  );
}
/*
onChanged: (val) {
            FocusScope.of(context).requestFocus(FocusNode());
            setState(() => dropdownValue = val);
          }
 */
