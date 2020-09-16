import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawy_app/blocs/blocs.dart';
import 'package:mawy_app/constants/colors.dart';
import 'package:mawy_app/data/models/offers.dart';
import 'package:mawy_app/functions/work_with_api/categories.dart';
import 'package:mawy_app/widgest/list_of_offers.dart';
import 'package:mawy_app/widgest/search_container.dart';
import 'package:mawy_app/widgest/widgets.dart';

class OffersScreen extends StatefulWidget {
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  AllOffersBloc allOffersBloc;
  TextEditingController _searchQuery;
  List<Offer> filteredRecord = [];
  List<Offer> offersList;
  String dropDownValue ;

  @override
  void initState() {
    _searchQuery = new TextEditingController();
    allOffersBloc = BlocProvider.of<AllOffersBloc>(context);
    allOffersBloc.add(FetchAllOffers());
    dropDownValue = "الكل";
    super.initState();
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
        backgroundColor: MAIN_COLOR,
        title: dropDownButton(
          dropdownValue: dropDownValue,
          function: updateSearchQueryDrop
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          searchBox(
              context: context,
              controller: _searchQuery,
              updateFunction: updateSearchQuery),
          Container(
            height: MediaQuery.of(context).size.height * 0.045,
            child: FutureBuilder(
                future: getAllCategories(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 2, bottom: 2, left: 2, right: 2),
                            child: Container(
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child:
                                    Text(snapshot.data[index].name.toString()),
                              )),
                              decoration: BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.circular(15)),
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
          Expanded(
            child: BlocBuilder<AllOffersBloc, AllOffersState>(
                builder: (context, state) {
              if (state is OffersLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is OffersLoaded) {
                offersList = state.allOffers;
                return filteredRecord != null && filteredRecord.length > 0
                    ? listOfOffers(offers: filteredRecord)
                    : offersList == null
                        ? new Center(child: new CircularProgressIndicator())
                        : listOfOffers(offers: offersList);
              } else if (state is ErrorInFetch) {
                return Text(state.message);
              }
              return Center(child: CircularProgressIndicator());
            }),
          )
        ],
      ),
    );
  }

  void updateSearchQuery(String newQuery) {
    filteredRecord.clear();
    if (newQuery.length > 0) {
      Set<Offer> set = Set.from(offersList);
      set.forEach((element) => filterList(element, newQuery));
    }

    if (newQuery.isEmpty) {
      filteredRecord.addAll(offersList);
    }
    setState(() {});
  }

  filterList(Offer offer, String searchQuery) {
    setState(() {
      if (offer.name.toLowerCase().contains(searchQuery) ||
          offer.name.contains(searchQuery)) {
        filteredRecord.add(offer);
      }
    });
  }

  void updateSearchQueryDrop(String selectedItem) {
    filteredRecord.clear();
    if (selectedItem.length > 0) {
      Set<Offer> set = Set.from(offersList);
      set.forEach((element) => filterListDrop(element, selectedItem));
    }

    if (selectedItem.isEmpty) {
      filteredRecord.addAll(offersList);
    }
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      dropDownValue = selectedItem;
    });
  }

  filterListDrop(Offer offer, String searchQuery) {
    setState(() {
      if (offer.cityName.toLowerCase() == searchQuery ) {
        filteredRecord.add(offer);
      }
    });
  }
}
