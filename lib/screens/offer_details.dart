import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mawy_app/constants/constants.dart';
import 'package:mawy_app/data/models/offers.dart';
import 'package:mawy_app/data/shared_preferences/prefs_keys.dart';
import 'package:mawy_app/functions/responsive_ui/info_widget.dart';
import 'package:mawy_app/functions/work_with_api/make_rating.dart';
import 'package:mawy_app/functions/work_with_api/suggestion.dart';
import 'package:mawy_app/widgest/floating_action_for_offers.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OfferDetails extends StatefulWidget {
  final Offer offer;

  OfferDetails({this.offer});

  @override
  _OfferDetailsState createState() => _OfferDetailsState();
}

class _OfferDetailsState extends State<OfferDetails> {
  PDFDocument _doc;
  bool loading;
  @override
  void initState() {
    initPDF();
    super.initState();
  }

  initPDF() async {
    setState(() {
      loading = true;
    });
    final doc = await PDFDocument.fromURL(
        'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf');
    setState(() {
      _doc = doc;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.offer.name.toString(),
          textDirection: TextDirection.rtl,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PDFViewer(document: _doc , showNavigation: true,showPicker: false, ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: CustomFloatingButtonForOffers(
        onTapRating: () {
          showRatingDialog(context ,widget.offer.id);
        },
        onTapShare: () {
          Share.share("share offer from mawy");
        },
      ),
    );
  }
}

showRatingDialog(BuildContext context , int offerId) {
  int ratingNumber ;
  showDialog(
      context: context,
      builder: (context) => new Dialog(
            insetPadding:
                EdgeInsets.only(top: 0, bottom: 0, right: 30, left: 30),
            elevation: 2,
            child: StatefulBuilder(builder: (context, setState) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.55,
                child: Column(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Icon(
                          Icons.star,
                          color: ICON_COLOR,
                          size: 60,
                        ),
                        Text(
                          "إذا أعجبك العرض قم بتقييمه",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                        RatingBar(
                          initialRating: 1,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            ratingNumber = rating.toInt();
                          },
                        ),
                        GestureDetector(
                          onTap: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            await makeRating(
                                userName: prefs.getString(USER_NAME_KEY),
                              offerId: offerId,
                              ratingNumber:ratingNumber
                            );
                            print("rating done");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 5, right: 10, left: 10),
                              child: Text(
                                "تقييم",
                                style: TextStyle(
                                    color: MAIN_COLOR,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    )),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InfoWidget(
                        returnedWidget: (context, deviceInfo) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              showSuggestionDialog(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              width: deviceInfo.localWidth,
                              child: Center(
                                child: Text(
                                  "اقترح عرض",
                                  style: TextStyle(
                                      color: MAIN_COLOR,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            }),
            backgroundColor: MAIN_COLOR,
          ));
}

showSuggestionDialog(BuildContext context) {
  TextEditingController suggestionController = TextEditingController();
  showDialog(
      context: context,
      builder: (context) => new Dialog(
            insetPadding:
                EdgeInsets.only(top: 0, bottom: 0, right: 30, left: 30),
            elevation: 2,
            child: StatefulBuilder(builder: (context, setState) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.55,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InfoWidget(
                        returnedWidget: (context, deviceInfo) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MAIN_COLOR,
                            ),
                            width: deviceInfo.localWidth,
                            child: Center(
                              child: Text(
                                "ما هو اقتراحك ؟",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "ادخل اقتراحك",
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: MAIN_COLOR)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: MAIN_COLOR)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: MAIN_COLOR))),
                        controller: suggestionController,
                        cursorColor: MAIN_COLOR,
                        maxLines: 15,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InfoWidget(
                        returnedWidget: (context, deviceInfo) {
                          return GestureDetector(
                            onTap: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await makeSuggestion(
                                  content: suggestionController.text.toString(),
                                  shopId: prefs.getInt(ID_KEY));
                              print("${prefs.getInt(ID_KEY).toString()}");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: MAIN_COLOR),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              width: deviceInfo.localWidth,
                              child: Center(
                                child: Text(
                                  "ارسال",
                                  style: TextStyle(
                                      color: MAIN_COLOR,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            }),
            backgroundColor: Colors.white,
          ));
}
