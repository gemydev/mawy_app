import 'package:flutter/material.dart';
import 'package:mawy_app/constants/constants.dart';
import 'package:mawy_app/data/models/offers.dart';
import 'package:mawy_app/functions/responsive_ui/info_widget.dart';
import 'package:mawy_app/widgest/floating_action_for_offers.dart';

class OfferDetails extends StatefulWidget {
  final Offer offer;

  OfferDetails({this.offer});

  @override
  _OfferDetailsState createState() => _OfferDetailsState();
}

class _OfferDetailsState extends State<OfferDetails> {
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
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: CustomFloatingButtonForOffers(
        onTapRating: () {
          showMaterialDialog(context);
        },
        onTapShare: () {},
      ),
    );
  }
}

showMaterialDialog(BuildContext context) {
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
                        Container(
                          color: Colors.white60,
                          child: Text("Stars"),
                        ),
                        Container(
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
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    )),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InfoWidget(
                        returnedWidget: (context, deviceInfo) {
                          return Container(
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
