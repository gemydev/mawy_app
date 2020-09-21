import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:mawy_app/blocs/all_offers/all_offers_bloc.dart';
import 'package:mawy_app/constants/constants.dart';
import 'package:mawy_app/data/models/categories.dart';
import 'package:mawy_app/data/shared_preferences/prefs_keys.dart';
import 'package:mawy_app/functions/navigation_funs.dart';
import 'package:mawy_app/functions/pdf_functions.dart';
import 'package:mawy_app/functions/work_with_api/categories.dart';
import 'package:mawy_app/functions/work_with_api/dio_function.dart';
import 'package:mawy_app/screens/login.dart';
import 'package:mawy_app/screens/test2.dart';
import 'package:mawy_app/widgest/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddYourOffer extends StatefulWidget {
  final String copon;
  AddYourOffer({this.copon});

  @override
  _AddYourOfferState createState() => _AddYourOfferState();
}

class _AddYourOfferState extends State<AddYourOffer> {
  TextEditingController offerNameController = TextEditingController();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String password, offerName, address, phone;
  List<String> _days = ['يوم', 'يومان', '3 أيام', '4 أيام'];
  List<String> _cities = ['ffff', 'mmm'];
  String _selectedDay;
  String _selectedCity;
  String _cityId;
  AllOffersBloc offersBloc;
  Color color;
  List<FullCategory> selectedCategories = [];
  bool selected = false;
  PlatformFile file;

  @override
  void initState() {
    offersBloc = BlocProvider.of<AllOffersBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    offersBloc.close();
    super.dispose();
  }

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
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  onTapToChooseFile().then((value) => file = value);
                },
                child: Center(
                  child: Icon(
                    Icons.library_books,
                    color: MAIN_COLOR,
                    size: 100,
                  ),
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
                            onSaved: (value) {
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
                                style:
                                    TextStyle(color: MAIN_COLOR, fontSize: 18),
                              )),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                  color: MAIN_COLOR,
                                  style: BorderStyle.solid,
                                  width: 0.80),
                            ),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: DropdownButtonFormField(
                                hint: Text(
                                  "اختر مدينتك",
                                  textDirection: TextDirection.rtl,
                                ),
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
                                    if (_selectedCity == 'ffff') {
                                      _cityId = '1';
                                    } else if (_selectedCity == 'mmm') {
                                      _cityId = '2';
                                    }
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
                          ),
                          Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text(
                                "مدة ظهور العرض",
                                style:
                                    TextStyle(color: MAIN_COLOR, fontSize: 18),
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
                            child: Text(
                              "تصنيف العرض",
                              style: TextStyle(color: MAIN_COLOR, fontSize: 18),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: FutureBuilder(
                                future: getAllCategories(),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 5,
                                                crossAxisSpacing: 10,
                                                childAspectRatio: 0.3),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                selectedCategories
                                                    .add(snapshot.data[index]);
                                                print('added');
                                              },
                                              child: Container(
                                                child: Center(
                                                    child: Text(snapshot
                                                        .data[index].name
                                                        .toString())),
                                                decoration: BoxDecoration(
                                                    color: color,
                                                    border: Border.all(
                                                        color: MAIN_COLOR),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                              ),
                                            ),
                                          );
                                        });
                                  } else {
                                    return Container(
                                      color: Colors.transparent,
                                    );
                                  }
                                }),
                          ),
                        ],
                      ),
                      key: _globalKey,
                    )
                  ],
                ),
              ),
              Center(
                child: RaisedButton(
                  onPressed: () async {
                    if (_globalKey.currentState.validate()) {
                      _globalKey.currentState.save();
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      offersBloc.add(AddOffer(
                          selectedCategories: selectedCategories,
                          shopID: prefs.getInt(ID_KEY).toString(),
                          copon: widget.copon,
                          cityId: _cityId,
                          offerName: offerName,
                      ));
                      uploadFileByDio(file);
                     // sendRequest(file.path);
                      normalShift(context, Login());
                    }
                  },
                  color: MAIN_COLOR,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 5, bottom: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Center(
                        child: Text(
                          "تم",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
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
