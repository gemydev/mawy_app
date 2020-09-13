import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawy_app/blocs/blocs.dart';
import 'package:mawy_app/constants/colors.dart';
import 'package:mawy_app/data/models/offers.dart';
import 'package:mawy_app/data/repositries/categories.dart';
import 'package:mawy_app/functions/navigation_funs.dart';
import 'package:mawy_app/screens/offer_details.dart';
import 'package:mawy_app/widgest/search_container.dart';

class OffersScreen extends StatefulWidget {
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  AllOffersBloc allOffersBloc;
  CategoriesRepositoryApi repositoryOfCategories;
  @override
  void initState() {
    allOffersBloc = BlocProvider.of<AllOffersBloc>(context);
    allOffersBloc.add(FetchAllOffers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MAIN_COLOR,
      ),
      body: Column(
        children: [
          SearchContainer(),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
           color: Colors.greenAccent,
           /*
            child: FutureBuilder(
              future:  repositoryOfCategories.getAllCategories() ,
                builder: (context , AsyncSnapshot snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context , index){
                      return Container(
                        child: Text(snapshot.data[index].name.toString()),
                      );
                    });
              }else{
                return Center(child: CircularProgressIndicator(),);
              }
            }),
            */
          ),
          Expanded(
            child: BlocBuilder<AllOffersBloc, AllOffersState>(
                builder: (context, state) {
              if (state is OffersLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is OffersLoaded) {
                return _listOfOffers(offers: state.allOffers);
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
}

Widget _listOfOffers({List<Offer> offers}) {
  return GridView.builder(
      shrinkWrap: true,
      itemCount: offers.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              normalShift(
                  context,
                  OfferDetails(
                    offer: offers[index],
                  ));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  color: MAIN_COLOR, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.white,
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      offers[index].name ?? "",
                      textDirection: TextDirection.rtl,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
