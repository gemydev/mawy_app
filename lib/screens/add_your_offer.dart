import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mawy_app/constants/constants.dart';
import 'package:mawy_app/functions/navigation_funs.dart';
import 'package:mawy_app/screens/login.dart';
import 'package:mawy_app/widgest/custom_text_field.dart';

class AddYourOffer extends StatefulWidget {
  @override
  _AddYourOfferState createState() => _AddYourOfferState();
}

class _AddYourOfferState extends State<AddYourOffer> {
  TextEditingController offerNameController = TextEditingController();
  String password, offerName, address, phone;
  List<String> _days = ['يوم', 'يومان', '3 أيام', '4 أيام'];
  List<String> _cities = ['ffff', 'mmm'];
  String _selectedDay;
  String _selectedCity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "أضف عرضك",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.library_books,
                  color: MAIN_COLOR,
                  size: 100,
                ),
              ),
              Center(
                child: Text(
                  "ارفع مجلتك",
                  style: TextStyle(fontSize: 18, color: MAIN_COLOR),
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Form(
                      child: Column(
                        textDirection: TextDirection.rtl,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "اسم العرض",
                              style: TextStyle(color: MAIN_COLOR, fontSize: 18),
                            ),
                          ),
                          CustomTextField(
                            onChange: (value) {
                              setState(() {
                                offerName = value;
                              });
                            },
                            controller: offerNameController,
                            hintText: "اسم العرض",
                          ),
                          Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text(
                                "المدينة",
                                style: TextStyle(color: MAIN_COLOR, fontSize: 18),
                              )),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                  color: MAIN_COLOR,
                                  style: BorderStyle.solid,
                                  width: 0.80),
                            ),
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    gapPadding: 0,
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none),
                              ),
                              isExpanded: true,
                              icon: Icon(
                                Icons.expand_more,
                                color: Colors.transparent,
                              ),
                              value: _selectedCity,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedCity = newValue;
                                });
                              },
                              items: _cities.map((city) {
                                return DropdownMenuItem(
                                  child: new Text(city),
                                  value: city,
                                );
                              }).toList(),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text(
                                "مدة ظهور العرض",
                                style: TextStyle(color: MAIN_COLOR, fontSize: 18),
                              )),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                    color: MAIN_COLOR,
                                    style: BorderStyle.solid,
                                    width: 0.80),
                              ),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      gapPadding: 0,
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none),
                                ),
                                isExpanded: true,
                                icon: Icon(
                                  Icons.expand_more,
                                  color: Colors.transparent,
                                ),
                                value: _selectedDay,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedDay = newValue;
                                  });
                                },
                                items: _days.map((day) {
                                  return DropdownMenuItem(
                                    child: new Text(day),
                                    value: day,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("تصنيف العرض" , style: TextStyle(color: MAIN_COLOR, fontSize: 18), ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    normalShift(context, Login());
                  },
                  color: MAIN_COLOR,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 5, bottom: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.8,
                      child: Center(
                        child: Text(
                          "تم",
                          style: TextStyle(
                              fontSize: 22, color: Colors.white , fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
