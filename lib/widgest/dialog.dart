import 'package:flutter/material.dart';
import 'package:mawy_app/constants/colors.dart';

class Packages extends StatefulWidget {
  final bool offerPackageSelected;
  String coponOfOffer;
  String coponOfInterim;
  bool offerPackageSelectedMust;
  bool interimPackageSelectedMust;
  Packages({this.offerPackageSelected});

  @override
  _PackagesState createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {
  bool weekPackageSelectedInOffer;
  bool weekPackageSelectedInInterim;
  bool initFormOfOffer;
  bool initFormOfInterim;

  @override
  void initState() {
    weekPackageSelectedInOffer = false;
    weekPackageSelectedInInterim = false;
    initFormOfOffer = true;
    initFormOfInterim = true;
    widget.interimPackageSelectedMust = false;
    widget.offerPackageSelectedMust = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.offerPackageSelected ? offersPackages() : interimOffer();
  }

  Widget offersPackages() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                weekPackageSelectedInOffer = false;
                initFormOfOffer = false;
                widget.offerPackageSelectedMust = true;
              });
            },
            child: Container(
              color: initFormOfOffer
                  ? Colors.white
                  : weekPackageSelectedInOffer ? Colors.white : MAIN_COLOR,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "باقة شهرية",
                      style: TextStyle(
                          fontSize: 18,
                          color: initFormOfOffer
                              ? MAIN_COLOR
                              : weekPackageSelectedInOffer
                                  ? MAIN_COLOR
                                  : Colors.white),
                    ),
                    Text("1000 ريال",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 18,
                            color: initFormOfOffer
                                ? MAIN_COLOR
                                : weekPackageSelectedInOffer
                                    ? MAIN_COLOR
                                    : Colors.white))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                weekPackageSelectedInOffer = true;
                initFormOfOffer = false;
                widget.offerPackageSelectedMust = true;
              });
            },
            child: Container(
              color: initFormOfOffer
                  ? Colors.white
                  : weekPackageSelectedInOffer ? MAIN_COLOR : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "باقة اسبوعية",
                      style: TextStyle(
                        fontSize: 18,
                        color: initFormOfOffer
                            ? MAIN_COLOR
                            : weekPackageSelectedInOffer
                                ? Colors.white
                                : MAIN_COLOR,
                      ),
                    ),
                    Text("250 ريال",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 18,
                            color: initFormOfOffer
                                ? MAIN_COLOR
                                : weekPackageSelectedInOffer
                                    ? Colors.white
                                    : MAIN_COLOR))
                  ],
                ),
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
                      onChanged: (value) {
                        setState(() {
                          widget.coponOfOffer = value;
                        });
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Add Coupon Code"),
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
          GestureDetector(
            onTap: () {
              setState(() {
                weekPackageSelectedInInterim = false;
                initFormOfInterim = false;
                widget.interimPackageSelectedMust = true;
              });
            },
            child: Container(
              color: initFormOfInterim
                  ? Colors.white
                  : weekPackageSelectedInInterim ? Colors.white : MAIN_COLOR,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "باقة شهرية",
                      style: TextStyle(
                          fontSize: 18,
                          color: initFormOfInterim
                              ? MAIN_COLOR
                              : weekPackageSelectedInInterim
                                  ? MAIN_COLOR
                                  : Colors.white),
                    ),
                    Text("300 ريال",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 18,
                            color: initFormOfInterim
                                ? MAIN_COLOR
                                : weekPackageSelectedInInterim
                                    ? MAIN_COLOR
                                    : Colors.white))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                weekPackageSelectedInInterim = true;
                initFormOfInterim = false;
                widget.interimPackageSelectedMust = true;
              });
            },
            child: Container(
              color: initFormOfInterim
                  ? Colors.white
                  : weekPackageSelectedInInterim ? MAIN_COLOR : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "باقة اسبوعية",
                      style: TextStyle(
                          fontSize: 18,
                          color: initFormOfInterim
                              ? MAIN_COLOR
                              : weekPackageSelectedInInterim
                                  ? Colors.white
                                  : MAIN_COLOR),
                    ),
                    Text("75 ريال",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 18,
                            color: initFormOfInterim
                                ? MAIN_COLOR
                                : weekPackageSelectedInInterim
                                    ? Colors.white
                                    : MAIN_COLOR))
                  ],
                ),
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
                      onChanged: (value) {
                        setState(() {
                          widget.coponOfInterim = value;
                        });
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Add Coupon Code"),
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
}
