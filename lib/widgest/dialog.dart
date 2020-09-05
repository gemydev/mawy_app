import 'package:flutter/material.dart';
import 'package:mawy_app/constants/colors.dart';



Widget offersPackages() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "باقة شهرية",
                  style: TextStyle(fontSize: 18, color: MAIN_COLOR),
                ),
                Text("1000 ريال",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 18, color: MAIN_COLOR))
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "باقة اسبوعية",
                  style: TextStyle(fontSize: 18, color: MAIN_COLOR),
                ),
                Text("250 ريال",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 18, color: MAIN_COLOR))
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "اضف الكوبون",
                    style: TextStyle(fontSize: 18, color: MAIN_COLOR),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Add Coupon Code"),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget interimOffer() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "باقة شهرية",
                  style: TextStyle(fontSize: 18, color: MAIN_COLOR),
                ),
                Text("300 ريال",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 18, color: MAIN_COLOR))
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "باقة اسبوعية",
                  style: TextStyle(fontSize: 18, color: MAIN_COLOR),
                ),
                Text("75 ريال",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 18, color: MAIN_COLOR))
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "اضف الكوبون",
                    style: TextStyle(fontSize: 18, color: MAIN_COLOR),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Add Coupon Code"),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
