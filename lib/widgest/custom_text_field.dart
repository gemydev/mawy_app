import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mawy_app/constants/colors.dart';




// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String hintText ;
  final TextEditingController controller;
  final Function onSaved ;

  CustomTextField({this.hintText, this.controller , this.onSaved});
  var border = new OutlineInputBorder(
    borderRadius: new BorderRadius.circular(15.0),
    borderSide: new BorderSide(
      color: MAIN_COLOR,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:  TextDirection.rtl,
      child: Center(
        child: TextFormField(
          onSaved: onSaved,
          controller: controller,
          cursorColor: MAIN_COLOR,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 8 , right: 8),
              hintText: hintText ,
              enabledBorder: border,
              border: border,
              focusedBorder: border
          ),
        ),
      ),
    );
  }
}
