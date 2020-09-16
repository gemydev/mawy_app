import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawy_app/blocs/all_offers/all_offers_bloc.dart';
import 'package:mawy_app/constants/colors.dart';
import 'package:mawy_app/constants/constants.dart';
import 'package:mawy_app/data/shared_preferences/prefs_keys.dart';
import 'package:mawy_app/functions/navigation_funs.dart';
import 'package:mawy_app/functions/responsive_ui/info_widget.dart';
import 'package:mawy_app/widgest/list_of_offers.dart';
import 'package:mawy_app/widgest/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'add_your_offer.dart';

enum HeaderTaps { one, two, three }

class YourStore extends StatefulWidget {
  @override
  _YourStoreState createState() => _YourStoreState();
}

class _YourStoreState extends State<YourStore> {
  bool offerPackageSelected;
  int shopId;
  HeaderTaps selectedTapInHeader;
  AllOffersBloc allOffersBloc;

  TextStyle selectedTapInHeaderStyle =
      TextStyle(color: MAIN_COLOR, fontSize: 18, fontWeight: FontWeight.bold);
  TextStyle notSelectedTapInHeaderStyle =
      TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);

  @override
  void initState() {
    offerPackageSelected = true;
    selectedTapInHeader = HeaderTaps.one;
    allOffersBloc = BlocProvider.of<AllOffersBloc>(context);
   function();
    allOffersBloc.add(FetchMyAllOffers(shopId: shopId));
    super.initState();
  }

  function() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      shopId = sharedPreferences.getInt(ID_KEY);
    });
  }

  @override
  void dispose() {
    allOffersBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "متجرك",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "العروض الخاصة بك",
              style: TextStyle(
                color: MAIN_COLOR,
                fontSize: 20,
              ),
            ),
          ),
          headerOfOffers(),
          Expanded(child: Container(
            child: selectedTapInHeader == HeaderTaps.one
                ? BlocBuilder<AllOffersBloc, AllOffersState>(
              builder: (context, state) {
                if (state is OffersLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is MyAllOffersLoaded) {
                  return Container(
                    child: listOfOffers(offers: state.myOffers),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            )
                : selectedTapInHeader == HeaderTaps.two
                ? BlocBuilder<AllOffersBloc, AllOffersState>(
              builder: (context, state) {
                if (state is OffersLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is MyWaitOffersLoaded) {
                  return Container(
                    child: listOfOffers(offers: state.myWaitOffers),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            )
                : BlocBuilder<AllOffersBloc, AllOffersState>(
              builder: (context, state) {
                if (state is OffersLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is MyRefusedOffersLoaded) {
                  return Container(
                    child: listOfOffers(offers: state.myRefusedOffers),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMaterialDialog(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  showMaterialDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => new Dialog(
              insetPadding:
                  EdgeInsets.only(top: 0, bottom: 0, right: 20, left: 20),
              elevation: 2,
              child: StatefulBuilder(builder: (context, setState) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: Column(
                    children: [
                      Text(
                        "اختر الباقة التي تناسبك",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    offerPackageSelected = true;
                                  });
                                },
                                child: Container(
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "باقات العروض",
                                      style: offerPackageSelected
                                          ? selectedTapInDialog
                                          : notSelectedTapInDialog,
                                    ),
                                  )),
                                  color: offerPackageSelected
                                      ? Colors.white
                                      : MAIN_COLOR,
                                ),
                              ),
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      offerPackageSelected = false;
                                    });
                                  },
                                  child: Container(
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "عرض مؤقت",
                                        style: offerPackageSelected
                                            ? notSelectedTapInDialog
                                            : selectedTapInDialog,
                                      ),
                                    )),
                                    color: !offerPackageSelected
                                        ? Colors.white
                                        : MAIN_COLOR,
                                  )),
                            ),
                            flex: 1,
                          )
                        ],
                      ),
                      Expanded(
                          child: Container(
                              child: Packages(
                        offerPackageSelected: offerPackageSelected,
                      ))),
                      InfoWidget(
                        returnedWidget: (context, deviceInfo) {
                          return GestureDetector(
                            onTap: () {
                              if (Packages().offerPackageSelectedMust ==
                                      false &&
                                  Packages().interimPackageSelectedMust ==
                                      false) {
                                Toast.show(
                                  "اختر باقة أولا",
                                  context,
                                  duration: Toast.LENGTH_SHORT,
                                  gravity: Toast.BOTTOM,
                                );
                              } else {
                                normalShift(
                                    context,
                                    AddYourOffer(
                                      copon: offerPackageSelected
                                          ? Packages().coponOfOffer
                                          : Packages().coponOfInterim,
                                    ));
                              }
                            },
                            child: Container(
                              width: deviceInfo.localWidth,
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'تــم',
                                  style: TextStyle(
                                      color: MAIN_COLOR,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                              color: Colors.white,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                );
              }),
              backgroundColor: MAIN_COLOR,
            ));
  }

  Widget headerOfOffers() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      textDirection: TextDirection.rtl,
      children: [
        SizedBox(
          width: 5,
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedTapInHeader = HeaderTaps.one;
                //allOffersBloc.add(FetchMyAllOffers(shopId: shopId));
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: selectedTapInHeader == HeaderTaps.one
                      ? MAIN_COLOR
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    "كل العروض",
                    style: TextStyle(
                      color: selectedTapInHeader == HeaderTaps.one
                          ? Colors.white
                          : MAIN_COLOR,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedTapInHeader = HeaderTaps.two;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: selectedTapInHeader == HeaderTaps.two
                      ? MAIN_COLOR
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    "العروض المنتظرة",
                    style: TextStyle(
                      color: selectedTapInHeader == HeaderTaps.two
                          ? Colors.white
                          : MAIN_COLOR,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedTapInHeader = HeaderTaps.three;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: selectedTapInHeader == HeaderTaps.three
                      ? MAIN_COLOR
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    "العروض المقبولة",
                    style: TextStyle(
                      color: selectedTapInHeader == HeaderTaps.three
                          ? Colors.white
                          : MAIN_COLOR,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
