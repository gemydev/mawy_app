import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawy_app/blocs/blocs.dart';
import 'package:mawy_app/constants/colors.dart';
import 'package:mawy_app/models/offers.dart';
import 'package:mawy_app/widgest/search_container.dart';
class OffersScreen extends StatefulWidget {
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MAIN_COLOR,
      ),
      body: Column(
        children: [
          SearchContainer(),
          Container(height: MediaQuery.of(context).size.height*0.05,color: Colors.grey,),
          Expanded(
            child: BlocBuilder<AllOffersBloc , AllOffersState>(builder: (context , state){
              if (state is OffersLoading) {
                return CircularProgressIndicator();
              } else if (state is OffersLoaded) {
                return _listOfOffers(offers: state.allOffers);
              } else if (state is ErrorInFetch) {
                return Text(state.message);
              }
              return Center(child: Text("error"));
            }),
          )
        ],
      ),
    );
  }
}

Widget _listOfOffers({List<Offer> offers}){
  return GridView.builder(
      shrinkWrap: true,
      itemCount: offers.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          childAspectRatio: 0.8
      ),
      itemBuilder: (context , index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height*0.1,
            decoration: BoxDecoration(
                color: MAIN_COLOR,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              children: [
                Expanded(child: Container(color: Colors.white,)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(offers[index].shopName, style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                  ),),
                ),
              ],
            ),
          ),
        );
      });
}
