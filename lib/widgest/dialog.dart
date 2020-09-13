import 'package:flutter/material.dart';
import 'package:mawy_app/constants/colors.dart';

class Packages extends StatefulWidget {
  final bool offerPackageSelected;

  Packages({this.offerPackageSelected});

  @override
  _PackagesState createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {
  bool weekPackageSelectedInOffer;
  bool weekPackageSelectedInInterim;

  @override
  void initState() {
    weekPackageSelectedInOffer = false;
    weekPackageSelectedInInterim = false;
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
              });
            },
            child: Container(
              color: weekPackageSelectedInOffer == false
                  ? Colors.white
                  : MAIN_COLOR,
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
                          color: weekPackageSelectedInOffer == false
                              ? MAIN_COLOR
                              : Colors.white),
                    ),
                    Text("1000 ريال",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 18,
                            color: weekPackageSelectedInOffer == false
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
              });
            },
            child: Container(
              color: weekPackageSelectedInOffer ? Colors.white : MAIN_COLOR,
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
                          color: weekPackageSelectedInOffer
                              ? MAIN_COLOR
                              : Colors.white),
                    ),
                    Text("250 ريال",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 18,
                            color: weekPackageSelectedInOffer
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
              });
            },
            child: Container(
              color: weekPackageSelectedInInterim == false
                  ? Colors.white
                  : MAIN_COLOR,
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
                          color: weekPackageSelectedInInterim == false
                              ? MAIN_COLOR
                              : Colors.white),
                    ),
                    Text("300 ريال",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 18,
                            color: weekPackageSelectedInInterim == false
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
              });
            },
            child: Container(
              color: weekPackageSelectedInInterim
                  ? Colors.white
                  : MAIN_COLOR,
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
                          color: weekPackageSelectedInInterim
                              ? MAIN_COLOR
                              : Colors.white),
                    ),
                    Text("75 ريال",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 18,
                            color: weekPackageSelectedInInterim
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
